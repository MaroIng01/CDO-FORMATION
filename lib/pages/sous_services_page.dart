// lib/pages/sous_services_page.dart

import 'package:flutter/material.dart'; // <-- CORRECTION DE L'IMPORT
import '../models/service.dart';
import '../models/sous_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SousServicesPage extends StatelessWidget {
  final Service service;

  const SousServicesPage({super.key, required this.service});

  Future<void> _openUrl(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d’ouvrir le lien')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // On regroupe les sous-services par catégorie
    final Map<String, List<SousService>> groupedServices = {};
    for (var sousService in service.sousServices) {
      (groupedServices[sousService.category] ??= []).add(sousService);
    }

    final categories = groupedServices.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final items = groupedServices[category]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre de la catégorie
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: Text(
                  category,
                  style: theme.textTheme.headlineMedium?.copyWith(color: theme.primaryColor),
                ),
              ),
              // Grille de fiches pour la catégorie
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 fiches par ligne
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // Ajustez pour changer la hauteur des fiches
                ),
                itemCount: items.length,
                itemBuilder: (context, gridIndex) {
                  final item = items[gridIndex];
                  return _buildFormationCard(item, context, theme);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget pour construire une fiche de formation
  Widget _buildFormationCard(SousService item, BuildContext context, ThemeData theme) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openUrl(item.url, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Image.asset(
                item.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                // Gestion d'erreur si l'image n'est pas trouvée
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: Icon(Icons.image_not_supported, color: Colors.grey.shade400),
                  );
                },
              ),
            ),
            // Contenu texte
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Titre
                    Text(
                      item.name,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Durées
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDurationRow(theme, Icons.timer_outlined, item.durationHours),
                        const SizedBox(height: 4),
                        _buildDurationRow(theme, Icons.calendar_today_outlined, item.durationDays),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour afficher une ligne de durée (icône + texte)
  Widget _buildDurationRow(ThemeData theme, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.black54),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
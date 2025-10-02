// lib/pages/more_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'infos_pratiques_page.dart';
import 'audit_conseils_page.dart';
import 'faq_page.dart'; // <-- Ajoutez cette importation

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _showCoordinates = false;

  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Impossible d’ouvrir le lien')));
    }
  }

  void _handleTap(BuildContext context, Map<String, dynamic> item) async {
    final String title = item['title'];

    // Gérer les pages natives
    if (title == 'Infos pratiques') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const InfosPratiquesPage()));
      return;
    }
    if (title == 'Audit et conseils') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AuditConseilsPage()));
      return;
    }
    // --- DÉBUT DE LA MODIFICATION ---
    if (title == 'FAQ') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FaqPage()));
      return;
    }
    // --- FIN DE LA MODIFICATION ---

    // Gérer les liens externes
    final Map<String, String> externalLinks = {
      'Nous Contacter': 'https://cdo-formation.fr/contact-v2.php',
    };

    if (externalLinks.containsKey(title)) {
      await openUrl(externalLinks[title]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> moreItems = [
      {'title': 'Audit et conseils', 'icon': Icons.assignment, 'route': '/audit'},
      {'title': 'Infos pratiques', 'icon': Icons.info_outline, 'route': '/infos'},
      {'title': 'FAQ', 'icon': Icons.help_outline, 'route': '/faq'},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Plus d\'infos', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 30),
              ...moreItems.map((item) => _buildMoreCard(item, theme, false)),
              _buildMoreCard({'title': 'Nous Contacter', 'icon': Icons.contact_mail, 'route': '/contact'}, theme, true),
              const SizedBox(height: 12),
              _buildCoordinatesCard(theme),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreCard(Map<String, dynamic> item, ThemeData theme, bool isPrimary) {
    return Card(
      color: isPrimary ? theme.primaryColor : Colors.white,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(item['icon'], color: isPrimary ? Colors.white : theme.primaryColor),
        title: Text(
          item['title'],
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: isPrimary ? Colors.white : theme.textTheme.bodyLarge?.color,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: isPrimary ? Colors.white70 : Colors.grey),
        onTap: () => _handleTap(context, item),
      ),
    );
  }

  Widget _buildCoordinatesCard(ThemeData theme) {
    return Card(
      color: const Color(0xFF2C3E50), // Dark slate color
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ExpansionTile(
        onExpansionChanged: (isExpanding) => setState(() => _showCoordinates = isExpanding),
        leading: const Icon(Icons.location_on, color: Colors.white),
        title: Text(
          'Nos coordonnées',
          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        trailing: Icon(
          _showCoordinates ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.white70,
        ),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              '''CDO FORMATION SAS
4, rue du couvent
41200 Millançay
Tél : 02 54 96 02 60
Portable : 06 30 82 18 84
contact@cdo-formation.fr
www.cdo-formation.fr

SIRET: 801 400 219 00011
APE: 8559A
N°OF: 24 41 01565 41''',
              style: TextStyle(fontSize: 15, height: 1.6, color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}

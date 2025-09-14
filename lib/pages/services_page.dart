// lib/pages/services_page.dart

import 'package:flutter/material.dart';
import '../models/service.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int? expandedIndex;

  final List<Service> services = [
    Service(
      id: 1, name: 'Formations de formateurs', 
      description: 'CDO Formation est habilité par l\'INRS sous le N° : 222/2011/PRAPIBC-2/11 pour dispenser la formation de formateurs PRAP IBC, et sous le N° : 1498/2012/PRAP2S-2/11 pour dispenser la formation de formateurs PRAP 2S. \nConcernant la formation de formateurs SST, nous travaillons avec notre partenaire "MFC-03410" habilité sous le N° : 2492/2013/SST-2/02. Ce dernier assure la formation de nos clients', 
      imagePath: 'lib/logos/reunion.jpg', sousServices: [], url: 'https://cdo-formation.fr/formations-v2.php?activeitem=1'
    ),
    Service(
      id: 2, name: 'Formation avec la CARSAT CVL', 
      description: 'Formations réalisées en partenariat avec la CARSAT Centre Val de Loire', 
      imagePath: 'lib/logos/reunion.jpg', sousServices: [], url: 'https://cdo-formation.fr/formations-v2.php?activeitem=6'
    ),
    Service(
      id: 3, name: 'Animateurs et Directeurs', 
      description: 'Un sauveteur secouriste du travail (ou SST) peut sauver des vies sur le lieu de travail, notamment en cas d’accident du travail. Il s’agit d’un membre du personnel ayant reçu l’instruction nécessaire pour donner les premiers secours en cas d’urgence et dans l’attente de l’arrivée des secours spécialisés. La présence de secouristes est obligatoire, selon l’article R. 4224-15 du Code du travail.', 
      imagePath: 'lib/logos/reunion.jpg', sousServices: [], url: 'https://cdo-formation.fr/formations-v2.php?activeitem=2'
    ),
    Service(
      id: 4, name: 'CSE et CSSCT', 
      description: 'Constitué dans tous les établissements occupant au moins 50 salariés, le CHSCT a pour mission de contribuer à la protection de la santé et de la sécurité des salariés ainsi qu’à l’amélioration des conditions de travail...', 
      imagePath: 'lib/logos/reunion.jpg', sousServices: [], url: 'https://cdo-formation.fr/formations-v2.php?activeitem=4'
    ),
    Service(
      id: 5, name: 'Salariés et autres publics', 
      description: 'La formation et l’information sont une obligation de l’employeur en matière de prévention des risques professionnels...', 
      imagePath: 'lib/logos/reunion.jpg', sousServices: [], url: 'https://cdo-formation.fr/formations-v2.php?activeitem=3'
    ),
  ];

  final List<Map<String, String>> externalLinks = [
    {'title': '📘 Notre catalogue de formation', 'url': 'https://cdo-formation.fr/formations-liste-v2.php'},
    {'title': '📅 Sessions inter-entreprises', 'url': 'https://cdo-formation.fr/sessions-v2.php'},
  ];

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Impossible d\'ouvrir le lien')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text('Nos Formations', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 30),
            ...List.generate(services.length, (index) {
              final service = services[index];
              final isExpanded = expandedIndex == index;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 12),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => setState(() => expandedIndex = isExpanded ? null : index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(service.imagePath, height: 180, width: double.infinity, fit: BoxFit.cover),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                        color: const Color(0xFF2C3E50), // Dark header for cards
                        child: Text(
                          service.name,
                          style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white, fontSize: 19),
                        ),
                      ),
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 20, 22, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(service.description ?? '', style: theme.textTheme.bodyLarge),
                              const SizedBox(height: 28),
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (service.url != null && service.url!.isNotEmpty) openUrl(service.url!);
                                },
                                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                                label: const Text('Voir les formations'),
                              ),
                            ],
                          ),
                        ),
                        crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 350),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 45),
            Divider(thickness: 1, color: Colors.grey.shade300),
            const SizedBox(height: 25),
            ...externalLinks.map((link) {
              return Card(
                color: theme.primaryColor.withOpacity(0.9),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(link['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17)),
                  trailing: const Icon(Icons.open_in_new, color: Colors.white),
                  onTap: () => openUrl(link['url']!),
                ),
              );
            }),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
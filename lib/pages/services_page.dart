import 'package:flutter/material.dart';
import '../models/service.dart';
import 'sous_services_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int? expandedIndex;

  final List<Service> services = [
    Service(
      id: 1,
      name: 'Formations de formateurs',
      description: 'CDO Formation est habilité...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
    ),
    Service(
      id: 2,
      name: 'Formation en partenariat avec la CARSAT CVL',
      description: 'CDO Formation est habilité...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
    ),
    Service(
      id: 3,
      name: 'Formations : Animateurs et Directeurs',
      description: 'CDO Formation est habilité...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
    ),
    Service(
      id: 4,
      name: 'Formation pour les CSE et CSSCT',
      description: 'CDO Formation est habilité...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
    ),
    Service(
      id: 5,
      name: 'Formations salariés et autres publics',
      description: 'CDO Formation est habilité...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
    ),
  ];

  final List<Map<String, String>> externalLinks = [
    {
      'title': 'Notre catalogue de formation',
      'url': 'https://cdo-formation.fr/formations-liste-v2.php',
    },
    {
      'title': 'Nos sessions inter-entreprises',
      'url': 'https://cdo-formation.fr/sessions-v2.php',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Nos Formations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFbb2d3b), // Rouge de l'entreprise
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ...List.generate(services.length, (index) {
            final service = services[index];
            final isExpanded = expandedIndex == index;

            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? null : index;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            service.imagePath,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF4c6c7b),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: Text(
                              service.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              service.description ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (service.sousServices.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          SousServicesPage(service: service),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Pas de formations détaillées disponibles.',
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Voir les formations'),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),

          // External links section
          ...externalLinks.map((item) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: const Color(0xFF4c6c7b), // Fond bleu-gris
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  item['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.open_in_new, color: Colors.white),
                onTap: () async {
                  final url = Uri.parse(item['url']!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Impossible d\'ouvrir le lien'),
                      ),
                    );
                  }
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

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
      id: 1,
      name: 'Formations de formateurs',
      description:
          'CDO Formation est habilité par l\'INRS sous le N° : 222/2011/PRAPIBC-2/11 pour dispenser la formation de formateurs PRAP IBC, et sous le N° : 1498/2012/PRAP2S-2/11 pour dispenser la formation de formateurs PRAP 2S. \n'
          'Concernant la formation de formateurs SST, nous travaillons avec notre partenaire "MFC-03410" habilité sous le N° : 2492/2013/SST-2/02. Ce dernier assure la formation  de nos clients',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
      url: 'https://cdo-formation.fr/formations-v2.php?activeitem=1',
    ),
    Service(
      id: 2,
      name: 'Formation avec la CARSAT CVL',
      description:
          'Formations réalisées en partenariat avec la CARSAT Centre Val de Loire',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
      url: 'https://cdo-formation.fr/formations-v2.php?activeitem=6',
    ),
    Service(
      id: 3,
      name: 'Animateurs et Directeurs',
      description:
          'Un sauveteur secouriste du travail (ou SST) peut sauver des vies sur le lieu de travail, notamment en cas d’accident du travail. Il s’agit d’un membre du personnel ayant reçu l’instruction nécessaire pour donner les premiers secours en cas d’urgence et dans l’attente de l’arrivée des secours spécialisés. La présence de secouristes est obligatoire, selon l’article R. 4224-15 du Code du travail.',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
      url: 'https://cdo-formation.fr/formations-v2.php?activeitem=2',
    ),
    Service(
      id: 4,
      name: 'CSE et CSSCT',
      description:
          'Constitué dans tous les établissements occupant au moins 50 salariés, le CHSCT a pour mission de contribuer à la protection de la santé et de la sécurité des salariés ainsi qu’à l’amélioration des conditions de travail...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
      url: 'https://cdo-formation.fr/formations-v2.php?activeitem=4',
    ),
    Service(
      id: 5,
      name: 'Salariés et autres publics',
      description:
          'La formation et l’information sont une obligation de l’employeur en matière de prévention des risques professionnels...',
      imagePath: 'lib/logos/reunion.jpg',
      sousServices: [],
      url: 'https://cdo-formation.fr/formations-v2.php?activeitem=3',
    ),
  ];

  final List<Map<String, String>> externalLinks = [
    {
      'title': '📘 Notre catalogue de formation',
      'url': 'https://cdo-formation.fr/formations-liste-v2.php',
    },
    {
      'title': '📅 Sessions inter-entreprises',
      'url': 'https://cdo-formation.fr/sessions-v2.php',
    },
  ];

  static const backgroundColor = Color(0xFFFDFCFB);
  static const primaryColor = Color(0xFF2C3E50);
  static const secondaryColor = Color(0xFFECF0F3);
  static const textColor = Color(0xFF2E2E2E);
  static const accentColor = Color(0xFFA83A3A);

  // Nouvelle méthode propre
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir le lien')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        children: [
          Text(
            'Nos Formations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: primaryColor,
              letterSpacing: 1.5,
              fontFamily: 'Poppins',
              shadows: [
                Shadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          ...List.generate(services.length, (index) {
            final service = services[index];
            final isExpanded = expandedIndex == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.025),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        expandedIndex = isExpanded ? null : index;
                      });
                    },
                    splashColor: accentColor.withOpacity(0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                          child: Image.asset(
                            service.imagePath,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.softLight,
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 22,
                            horizontal: 24,
                          ),
                          color: primaryColor,
                          child: Text(
                            service.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.1,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.description ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: textColor,
                                    height: 1.5,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 26),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    if (service.url != null && service.url!.isNotEmpty) {
                                      openUrl(service.url!);
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios, size: 18),
                                  label: const Text('Voir les formations'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: accentColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 14,
                                    ),
                                    elevation: 6,
                                    shadowColor: accentColor.withOpacity(0.6),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 350),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 40),
          Divider(thickness: 1.4, color: Colors.grey.shade300),
          const SizedBox(height: 18),
          ...externalLinks.map((link) {
            return Card(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              margin: const EdgeInsets.symmetric(vertical: 12),
              elevation: 8,
              shadowColor: Colors.black38,
              child: ListTile(
                title: Text(
                  link['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                trailing: const Icon(Icons.open_in_new, color: Colors.white),
                onTap: () => openUrl(link['url']!),
              ),
            );
          }),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

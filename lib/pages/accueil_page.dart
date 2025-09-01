import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccueilPage extends StatefulWidget {
  final VoidCallback? onNavigateToServices;

  const AccueilPage({super.key, this.onNavigateToServices});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool showSmallLogos = false;

  static const backgroundColor = Color(0xFFFDFCFB);
  static const primaryColor = Color(0xFF2C3E50);
  static const secondaryColor = Color(0xFFECF0F3);
  static const textColor = Color(0xFF2E2E2E);
  static const accentColor = Color(0xFFA83A3A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          final offset = scrollNotification.metrics.pixels;
          setState(() => showSmallLogos = offset > 80);
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 180,
              backgroundColor: backgroundColor,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(right: 16, bottom: 16),
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: showSmallLogos ? 1.0 : 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('lib/logos/header-logo.jpg', height: 30),
                          const SizedBox(width: 8),
                          Image.asset(
                            'lib/logos/logo-qualiopi-2022.png',
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    background: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Image.asset(
                          'lib/logos/header-logo.jpg',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const Text(
                      'CDO Formation est un centre spécialisé dans le développement des compétences numériques et professionnelles.\n'
                      'Nous proposons des formations innovantes, accessibles à tous, dans les domaines du digital, de la bureautique, de la gestion et bien plus encore.',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: textColor,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                        shadowColor: accentColor.withOpacity(0.6),
                      ),
                      onPressed: () {
                        widget.onNavigateToServices?.call();
                      },
                      child: const Text(
                        'Voir Nos Formations',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    sectionTitle('Informations'),
                    infoCard(
                      imagePath: 'lib/logos/26_ind.jpg',
                      title: 'FORMACONNECT enfin arrivée',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=26',
                      date: '01 jan 2023',
                      description:
                          'Le logiciel qui connecte les OF et les intervenants. Accéder au site formaconnect\n\nVous proposez des formations, et vous cherchez des formateurs disponibles selon l\'intitulé de la formation, le lieu de la mission, les dates d\'intervention.\n\nVous êtes formateur intervenant, et vous cherchez des missions de formation ? Proposez vos compétences selon vos disponibilités. Accéder au site formaconnect',
                    ),
                    const SizedBox(height: 40),
                    sectionTitle('Actualités'),
                    infoCard(
                      imagePath: 'lib/logos/21_ind.jpg',
                      title: 'ALM Evolution des formations prap 2S et APS ASD',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=20',
                      date: '13 déc 2020',
                      description:
                          'L\'apprentissage des techniques de manutention pour les personnes à mobilité réduite a connu ses limites. La sinistralité importante dans le secteur a amené le réseau prévention à aller vers un portage non délétère, pour ne pas dire le portage ZERO.',
                    ),
                    infoCard(
                      imagePath: 'lib/logos/24_ind.jpg',
                      title:
                          'Pour la contamination COVID-19, CDO FORMATION s\'engage',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=24',
                      date: '18 août 2020',
                      description:
                          'Nous avons ainsi mis en place une stratégie préventive pour protéger nos clients et nos collaborateurs.\n Tous nos protocoles Questionnaire symptômes',
                    ),
                    infoCard(
                      imagePath: 'lib/logos/header-logo.jpg',
                      title: 'Un nouveau dispositif pour les EHPAD',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=17',
                      date: '01 oct 2015',
                      description:
                          'Le dispositif HAPA est une réponse élaborée par la profession, et destinée aux établissements d\'hébergement et aide aux personnes âgées.',
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

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          letterSpacing: 1,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget infoCard({
    required String imagePath,
    required String title,
    required String url,
    required String date,
    required String description,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 14),
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: accentColor.withOpacity(0.2),
        onTap: () => launchUrl(Uri.parse(url)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Publié le $date',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12),
              ..._parseDescription(description),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _parseDescription(String text) {
    final Map<String, String> linksMap = {
      'Accéder au site formaconnect':
          'https://formaconnect.com/inscription.php',
      'Tous nos protocoles': 'https://cdo-formation.fr/infos-covid-19.php',
      'Questionnaire symptômes': 'https://cdo-formation.fr/covid-19.php',
    };

    final RegExp linkRegex = RegExp(linksMap.keys.map(RegExp.escape).join('|'));
    final List<Widget> widgets = [];
    int currentIndex = 0;

    for (final match in linkRegex.allMatches(text)) {
      if (match.start > currentIndex) {
        widgets.add(
          Text(
            text.substring(currentIndex, match.start),
            style: const TextStyle(
              fontSize: 15,
              height: 1.4,
              color: textColor,
              fontFamily: 'Poppins',
            ),
          ),
        );
      }

      final linkText = match.group(0)!;
      final linkUrl = linksMap[linkText]!;

      widgets.add(
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(linkUrl)),
          child: Text(
            linkText,
            style: const TextStyle(
              fontSize: 15,
              color: accentColor,
              //decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              height: 1.4,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      widgets.add(
        Text(
          text.substring(currentIndex),
          style: const TextStyle(
            fontSize: 15,
            height: 1.4,
            color: textColor,
            fontFamily: 'Poppins',
          ),
        ),
      );
    }

    return widgets;
  }
}

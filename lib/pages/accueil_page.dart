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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          final offset = scrollNotification.metrics.pixels;
          if (offset > 80 && !showSmallLogos) {
            setState(() => showSmallLogos = true);
          } else if (offset <= 80 && showSmallLogos) {
            setState(() => showSmallLogos = false);
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 180,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset('lib/logos/header-logo.jpg', height: 30),
                          ),
                          Image.asset('lib/logos/logo-qualiopi-2022.png', height: 30),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'CDO Formation est un centre spécialisé dans le développement des compétences numériques et professionnelles.\n'
                      'Nous proposons des formations innovantes, accessibles à tous, dans les domaines du digital, de la bureautique, de la gestion et bien plus encore. Rejoignez-nous pour booster votre carrière et apprendre à votre rythme !',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4c6c7b),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (widget.onNavigateToServices != null) {
                          widget.onNavigateToServices!();
                        } else {
                          // fallback: par exemple navigation directe (pas recommandé si tu utilises BottomNavigationBar)
                          Navigator.pushNamed(context, '/services');
                        }
                      },
                      child: const Text('Voir les services'),
                    ),
                    const SizedBox(height: 40),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informations',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    infoCard(
                      imagePath: 'lib/logos/26_ind.jpg',
                      title: 'FORMACONNECT enfin arrivée',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=26',
                      date: '01 jan 2023',
                      description:
                          'Le logiciel qui connecte les OF et les intervenants. Accéder au site formaconnect\n\n'
                          'Vous proposez des formations, et vous cherchez des formateurs disponibles selon l\'intitulé de la formation, le lieu de la mission, les dates d\'intervention.\n\n'
                          'Vous êtes formateur intervenant, et vous cherchez des missions de formation ? Proposez vos compétences selon vos disponibilités. Accéder au site formaconnect',
                    ),
                    const SizedBox(height: 20),

                    infoCard(
                      imagePath: 'lib/logos/21_ind.jpg',
                      title:
                          'Les MAC FO PRAP 2S et FO APS ASD transformés en ALM chez CDO Formation',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=21',
                      date: '13 déc 2020',
                      description:
                          'Dès la rentrée 2021, toutes nos formations de secteur médico-Social, en particulier la PRAP 2S et APS ASD comporteront l\'accompagnement à la mobilité. \n'
                          'Ainsi, tous les MAC de ces deux domaines seront organisés comme session ALM',
                    ),
                    const SizedBox(height: 40),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Actualités',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    infoCard(
                      imagePath: 'lib/logos/21_ind.jpg',
                      title: 'ALM Evolution des formations prap 2S et APS ASD',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=20',
                      date: '13 déc 2020',
                      description:
                          'L\'apprentissage des techniques de manutention pour les personnes à mobilité réduite, a connu ses limites.\n'
                          'La sinistralité importante dans le secteur a amené le réseau prévention à aller vers un portage non délétère pour ne pas dire le portage ZERO: de la manutention à l\'accompagnement à la mobilité.',
                    ),
                    const SizedBox(height: 20),

                    infoCard(
                      imagePath: 'lib/logos/24_ind.jpg',
                      title:
                          'Pour la contamination COVID-19, CDO FORMATION s\'engage',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=24',
                      date: '18 août 2020',
                      description:
                          'Nous avons ainsi mis en place une stratégie préventive pour protéger nos clients et nos collaborateurs.\n'
                          'Tous nos protocoles'
                          'Questionnaire symptômes',
                    ),
                    const SizedBox(height: 20),

                    infoCard(
                      imagePath: 'lib/logos/header-logo.jpg',
                      title: 'Un nouveau dispositif pour les EHPAD',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=17',
                      date: '01 oct 2015',
                      description:
                          'Le dispositif HAPA est une réponse élaborée par la profession, et destinée aux établissements d\'hébergement et aide aux personnes âgées.',
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, height: 180, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async => await launchUrl(Uri.parse(url)),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Publié le $date',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 8),
            ..._parseDescription(description, url),
          ],
        ),
      ),
    );
  }

  List<Widget> _parseDescription(String text, String url) {
    final Map<String, String> linksMap = {
      'Accéder au site formaconnect': 'https://formaconnect.com/inscription.php',
      'Tous nos protocoles': 'https://cdo-formation.fr/infos-covid-19.php',
      'Questionnaire symptômes': 'https://cdo-formation.fr/covid-19.php',
    };

    final RegExp linkRegex = RegExp(
      linksMap.keys.map(RegExp.escape).join('|'),
      caseSensitive: false,
    );

    final List<Widget> widgets = [];
    final matches = linkRegex.allMatches(text).toList();

    int currentIndex = 0;

    for (final match in matches) {
      if (match.start > currentIndex) {
        widgets.add(
          Text(
            text.substring(currentIndex, match.start),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        );
      }

      final matchedText = match.group(0)!;
      final matchedUrl = linksMap.entries.firstWhere(
        (entry) => matchedText.toLowerCase().contains(entry.key.toLowerCase()),
      ).value;

      widgets.add(
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(matchedUrl)),
          child: Text(
            matchedText,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4c6c7b),
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
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      );
    }

    return widgets;
  }
}

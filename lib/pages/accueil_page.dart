import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'services_page.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool showSmallLogos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFbb2d3b)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            drawerItem('Accueil'),
            drawerItem('Nos formations'),
            drawerItem('Audit et conseils'),
            drawerItem('Infos pratiques'),
            drawerItem('FAQ'),
          ],
        ),
      ),
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
                  var top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(right: 16, bottom: 16),
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: showSmallLogos ? 1.0 : 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('lib/logos/header-logo.jpg', height: 30),
                          const SizedBox(width: 10),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ServicesPage(),
                          ),
                        );
                      },
                      child: const Text('Voir les services'),
                    ),
                    const SizedBox(height: 40),

                    // ===== SECTION 1 : Informations =====
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informations',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    infoCard(
                      imagePath: 'lib/logos/26_ind.jpg',
                      title: 'FORMACONNECT enfin arrivée',
                      url: 'https://formaconnect.com/inscription.php',
                      date: '01 jan 2023',
                      description:
                          'Le logiciel qui connecte les OF et les intervenants. Accéder au site formaconnect.\n\n'
                          'Vous proposez des formations, et vous cherchez des formateurs disponibles selon l\'intitulé de la formation, le lieu de la mission, les dates d\'intervention.\n\n'
                          'Vous êtes formateur intervenant, et vous cherchez des missions de formation ? Proposez vos compétences selon vos disponibilités. Accéder au site formaconnect.',
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
                          'Ainsi, tous les MAC de ces deux domaines  seront organisés comme session ALM',
                    ),

                    const SizedBox(height: 40),

                    // ===== SECTION 2 : Actualités =====
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Actualités',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFbb2d3b),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    infoCard(
                      imagePath: 'lib/logos/actu1.jpg',
                      title: 'Titre Actualité',
                      url: 'https://example.com',
                      date: '20 jan 2023',
                      description:
                          'Contenu de l\'actualité. Accéder au site pour en savoir plus.',
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

  ListTile drawerItem(String title) {
    return ListTile(title: Text(title), onTap: () => Navigator.pop(context));
  }

  /// Widget personnalisé pour les cartes d'information ou d'actualité
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
              // Pour centrer l’image
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
                  color: Color(0xFFbb2d3b),
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

  /// Sépare la description par "Accéder au site" et insère des liens
  List<Widget> _parseDescription(String text, String url) {
    List<Widget> widgets = [];
    List<String> parts = text.split(RegExp(r'Accéder au site[\w\s]*\.?'));

    final matches = RegExp(
      r'Accéder au site[\w\s]*\.?',
    ).allMatches(text).toList();

    for (int i = 0; i < parts.length; i++) {
      widgets.add(
        Text(
          parts[i],
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      );

      if (i < matches.length) {
        widgets.add(
          GestureDetector(
            onTap: () => launchUrl(Uri.parse(url)),
            child: Text(
              matches[i].group(0) ?? "Accéder au site",
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFbb2d3b),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }
}

// lib/pages/accueil_page.dart

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
    // Using theme colors for consistency
    final theme = Theme.of(context);

    return Scaffold(
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
              backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.8),
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
                          Image.asset('lib/logos/logo-qualiopi-2022.png', height: 30),
                        ],
                      ),
                    ),
                    background: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Image.asset('lib/logos/header-logo.jpg', width: 120, height: 120),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'CDO Formation est un centre spécialisé dans le développement des compétences numériques et professionnelles.\n'
                      'Nous proposons des formations innovantes, accessibles à tous, dans les domaines du digital, de la bureautique, de la gestion et bien plus encore.',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: widget.onNavigateToServices,
                      child: const Text('Voir Nos Formations'),
                    ),
                    const SizedBox(height: 50),
                    _sectionTitle('Informations', theme),
                    _infoCard(
                      theme: theme,
                      imagePath: 'lib/logos/26_ind.jpg',
                      title: 'FORMACONNECT enfin arrivée',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=26',
                      date: '01 jan 2023',
                      description:
                          'Le logiciel qui connecte les OF et les intervenants. Accéder au site formaconnect\n\nVous proposez des formations, et vous cherchez des formateurs disponibles selon l\'intitulé de la formation, le lieu de la mission, les dates d\'intervention.\n\nVous êtes formateur intervenant, et vous cherchez des missions de formation ? Proposez vos compétences selon vos disponibilités. Accéder au site formaconnect',
                    ),
                    const SizedBox(height: 40),
                    _sectionTitle('Actualités', theme),
                    _infoCard(
                      theme: theme,
                      imagePath: 'lib/logos/21_ind.jpg',
                      title: 'ALM Evolution des formations prap 2S et APS ASD',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=20',
                      date: '13 déc 2020',
                      description:
                          'L\'apprentissage des techniques de manutention pour les personnes à mobilité réduite a connu ses limites. La sinistralité importante dans le secteur a amené le réseau prévention à aller vers un portage non délétère, pour ne pas dire le portage ZERO.',
                    ),
                    _infoCard(
                      theme: theme,
                      imagePath: 'lib/logos/24_ind.jpg',
                      title: 'Pour la contamination COVID-19, CDO FORMATION s\'engage',
                      url: 'https://cdo-formation.fr/actualites-v2.php?actu=24',
                      date: '18 août 2020',
                      description:
                          'Nous avons ainsi mis en place une stratégie préventive pour protéger nos clients et nos collaborateurs.\n Tous nos protocoles Questionnaire symptômes',
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

  Widget _sectionTitle(String title, ThemeData theme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title, style: theme.textTheme.headlineMedium),
      ),
    );
  }

  Widget _infoCard({
    required ThemeData theme,
    required String imagePath,
    required String title,
    required String url,
    required String date,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 14),
      clipBehavior: Clip.antiAlias, // Ensures the image respects the card's rounded corners
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                  const SizedBox(height: 6),
                  Text('Publié le $date', style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 12),
                  ..._parseDescription(description, theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _parseDescription(String text, ThemeData theme) {
    final Map<String, String> linksMap = {
      'Accéder au site formaconnect': 'https://formaconnect.com/inscription.php',
      'Tous nos protocoles': 'https://cdo-formation.fr/infos-covid-19.php',
      'Questionnaire symptômes': 'https://cdo-formation.fr/covid-19.php',
    };

    final RegExp linkRegex = RegExp(linksMap.keys.map(RegExp.escape).join('|'));
    final List<Widget> widgets = [];
    int currentIndex = 0;

    for (final match in linkRegex.allMatches(text)) {
      if (match.start > currentIndex) {
        widgets.add(Text(text.substring(currentIndex, match.start), style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)));
      }
      final linkText = match.group(0)!;
      final linkUrl = linksMap[linkText]!;
      widgets.add(
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(linkUrl)),
          child: Text(
            linkText,
            style: TextStyle(
              fontSize: 15,
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ),
      );
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      widgets.add(Text(text.substring(currentIndex), style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)));
    }
    return widgets;
  }
}
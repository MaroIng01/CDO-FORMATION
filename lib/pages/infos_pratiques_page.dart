// lib/pages/infos_pratiques_page.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfosPratiquesPage extends StatelessWidget {
  const InfosPratiquesPage({super.key});

  // Helper pour lancer les URLs (téléphone, mail, web, maps)
  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'ouvrir le lien : $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Infos Pratiques'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Nos Coordonnées', theme),
            _buildSiegeSocialCard(context, theme),
            _buildParisIdfCard(context, theme),
            _buildSectionTitle('Nos Principales Salles de Formation', theme),
            _buildSallesList(theme),
            const SizedBox(height: 20),
            _buildOrleansIngreCard(context, theme),
            _buildParisBercyCard(context, theme),
            _buildRomorantinCard(context, theme),
          ],
        ),
      ),
    );
  }

  // Widget pour les titres de section
  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Text(title, style: theme.textTheme.headlineMedium),
    );
  }

  // --- WIDGETS SPÉCIFIQUES POUR CHAQUE CARTE ---

  // Carte pour le Siège Social
  Widget _buildSiegeSocialCard(BuildContext context, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text('CDO Formation Siège Social',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text('4, rue du couvent\n41200 Millançay'),
          ),
          const Divider(height: 1),
          _buildContactRow(context,
              icon: FontAwesomeIcons.phone,
              text: '02 54 96 02 60',
              url: 'tel:0254960260'),
          _buildContactRow(context,
              icon: FontAwesomeIcons.mobileScreenButton,
              text: '06 30 82 18 84',
              url: 'tel:0630821884'),
          _buildContactRow(context,
              icon: FontAwesomeIcons.fax,
              text: '02 72 22 06 14',
              url: 'tel:0272220614'),
          _buildContactRow(context,
              icon: FontAwesomeIcons.solidEnvelope,
              text: 'contact@cdo-formation.fr',
              url: 'mailto:contact@cdo-formation.fr'),
          _buildContactRow(context,
              icon: FontAwesomeIcons.globe,
              text: 'www.cdo-formation.fr',
              url: 'https://www.cdo-formation.fr'),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Carte pour Paris IDF
  Widget _buildParisIdfCard(BuildContext context, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const ListTile(
            title: Text('Centre de formation Paris IDF',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text(
                '11, rue Cambrai, Pont Flandre\nICADE, Immeuble l\'Artois\n75945 PARIS CEDEX 19'),
          ),
          const Divider(height: 1),
          _buildContactRow(context,
              icon: FontAwesomeIcons.phone,
              text: '01 78 42 92 27',
              url: 'tel:0178429227'),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Liste simple pour les autres salles
  Widget _buildSallesList(ThemeData theme) {
    const villes = [
      'PARIS',
      'REIMS',
      'ORLÉANS Saint Jean de Braye',
      'ORLÉANS Saint Jean de La Ruelle',
      'BLOIS',
      'ROMORANTIN'
    ];
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children:
                    villes.map((ville) => Chip(label: Text(ville))).toList(),
              ),
              const SizedBox(height: 12),
              Text(
                "Nous intervenons en intra dans toutes les régions.",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontStyle: FontStyle.italic),
              )
            ],
          ),
        ));
  }

  // Carte pour Orléans INGRE
  Widget _buildOrleansIngreCard(BuildContext context, ThemeData theme) {
    return _buildLocationDetailCard(
      context: context,
      theme: theme,
      title: 'Formation organisée à Orléans INGRE',
      imagePath: 'assets/Orléans.jpg', // <--- Mettez votre nom d'image ici
      address: 'CDO FORMATION-ORLEANS\n21 Rue Henry DUNANT\n45140 INGRE',
      notes: [
        'Principe horaire: La première journée de la première session débute à 9H00.',
        'Hébergement: Plusieurs hôtels sont à proximité.'
      ],
      googleMapsUrl:
          'https://www.google.fr/maps/place/21+Rue+Henry+Dunant,+45140+Ingr%C3%A9,+France/@47.9065938,1.8515819,17z/data=!3m1!4b1!4m6!3m5!1s0x47e4effe04abf57f:0xd03a6f55e8cb5890!8m2!3d47.9065938!4d1.8515819!16s%2Fg%2F11cp7tk0hh?entry=ttu&g_ep=EgoyMDI1MDkyNC4wIKXMDSoASAFQAw%3D%3D',
    );
  }

  // Carte pour Paris Porte de Bercy
  Widget _buildParisBercyCard(BuildContext context, ThemeData theme) {
    return _buildLocationDetailCard(
        context: context,
        theme: theme,
        title: 'Centre de formation Paris Porte de Bercy',
        imagePath: 'assets/5.jpg', // <--- Mettez votre nom d'image ici
        address: '2 rue du nouveau Bercy\n94220 CHARENTON LE PONT',
        notes: [
          'Situé à la sortie de la porte de Bercy, à proximité du Centre commercial Bercy-2. Parking possible au centre commercial.',
          'Principe horaire: La formation débute à 9H00 le premier jour et s’achève à 17H00 le dernier jour.'
        ],
        googleMapsUrl:
            'https://www.google.fr/maps/place/2+Rue+du+Nouveau+Bercy,+94220+Charenton-le-Pont,+France/@48.8233819,2.3965395,16z/data=!4m6!3m5!1s0x47e6724fc4e2921f:0xad219731edede498!8m2!3d48.8232264!4d2.3970777!16s%2Fg%2F11c1j19pzr?entry=ttu&g_ep=EgoyMDI1MDkyNC4wIKXMDSoASAFQAw%3D%3D',
        pdfUrl:
            'https://cdo-formation.fr/documents/0/plan_acces_charenton.pdf' // <--- Mettez votre lien PDF ici
        );
  }

  // Carte pour Romorantin
  Widget _buildRomorantinCard(BuildContext context, ThemeData theme) {
    return _buildLocationDetailCard(
        context: context,
        theme: theme,
        title: 'Formation organisée à Romorantin',
        imagePath: 'assets/13.jpg', // <--- Mettez votre nom d'image ici
        address:
            'Ethic Etape Jean MONNET\n2, Rue du stade (ou Rue Jean MONNET)\n41200 Romorantin',
        notes: [
          'Principe horaire: Pour chaque session, la formation débute à 9H00 le premier jour et s’achève à 17H00.'
        ],
        googleMapsUrl:
            'https://www.google.fr/maps/place/Ethic+Etapes+Jean+Monnet/@47.355764,1.751872,17z/data=!3m1!4b1!4m2!3m1!1s0x47fb315fb389babb:0x25d8ee0c24038a13',
        pdfUrl:
            'https://cdo-formation.fr/documents/44/plan_ethic_etape.pdf' // <--- Mettez votre lien PDF ici
        );
  }

  // --- WIDGETS GÉNÉRIQUES RÉUTILISABLES ---

  // Ligne de contact cliquable
  Widget _buildContactRow(BuildContext context,
      {required IconData icon, required String text, required String url}) {
    return InkWell(
      onTap: () => _launchURL(url, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            FaIcon(icon, size: 16, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
          ],
        ),
      ),
    );
  }

  // Modèle de carte pour un lieu détaillé (image, adresse, notes, liens)
  Widget _buildLocationDetailCard({
    required BuildContext context,
    required ThemeData theme,
    required String title,
    required String imagePath,
    required String address,
    required List<String> notes,
    required String googleMapsUrl,
    String? pdfUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mettez un placeholder si l'image n'existe pas
          Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                color: Colors.grey[300],
                child: const Center(
                    child: Icon(Icons.image, color: Colors.grey, size: 50)),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                const SizedBox(height: 16),
                _buildInfoRow(theme,
                    icon: FontAwesomeIcons.locationDot, text: address),
                const Divider(height: 24),
                ...notes.map((note) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildInfoRow(theme,
                          icon: FontAwesomeIcons.circleInfo, text: note),
                    )),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (pdfUrl != null)
                      TextButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.solidFilePdf,
                            size: 16),
                        label: const Text('Plan d\'accès'),
                        onPressed: () => _launchURL(pdfUrl, context),
                      ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      icon: const FaIcon(FontAwesomeIcons.mapLocationDot,
                          size: 16),
                      label: const Text('Carte'),
                      onPressed: () => _launchURL(googleMapsUrl, context),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(ThemeData theme,
      {required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(icon, size: 14, color: Colors.black54),
        const SizedBox(width: 12),
        Expanded(
            child: Text(text,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15))),
      ],
    );
  }
}

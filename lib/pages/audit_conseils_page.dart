// lib/pages/audit_conseils_page.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuditConseilsPage extends StatelessWidget {
  const AuditConseilsPage({super.key});

  // Helper pour lancer les URLs
  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'ouvrir le lien : $url')),
      );
    }
  }

  // Helper pour créer du texte cliquable
  TextSpan _linkTextSpan({
    required String text,
    required String url,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return TextSpan(
      text: text,
      style: TextStyle(
        color: theme.primaryColor,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () => _launchURL(url, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyTextStyle =
        theme.textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6);

    final List<String> processSteps = [
      'Analyse des besoins de nos clients et de leurs cahiers des charges ;',
      'Formalisation de projets et propositions écrites ;',
      'Tarifications « sur mesure », adaptées aux contraintes économiques ;',
      'Revue de contrat rigoureuse, précise et systématique ;',
      'Validation du « projet définitif » avec nos clients après ajustements;',
      'Suivi, évaluation des missions assurées par le même interlocuteur, consultant senior ;',
      'Contrôle des indicateurs et des résultats lors de la réalisation des projets ;',
      'Bilan - vérification de conformité des missions avec les cahiers des charges.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit & Conseils'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- PREMIÈRE IMAGE ---
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/20.jpg', // <-- Remplacez par le nom de votre image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(
                        child: Icon(Icons.image, color: Colors.grey, size: 50)),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // --- TEXTE D'INTRODUCTION AVEC LIENS ---
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: bodyTextStyle,
                children: [
                  const TextSpan(
                    text:
                        'Afin de vous proposer une offre complète allant du conseil à la réalisation dans les domaines de la prévention des risques professionnels, nous nous sommes associés à un partenaire professionnel partageant les mêmes valeurs fondamentales de transparence et de progrès humain : ',
                  ),
                  _linkTextSpan(
                      text: 'ERGOS CONCEPT',
                      url: 'https://www.ergos-concept.com/',
                      context: context),
                  const TextSpan(text: ' basé à Paris. \n '),
                  _linkTextSpan(
                      text: 'CAP SOCIETAL',
                      url: 'https://cap-societal.com/home',
                      context: context),
                  const TextSpan(
                      text:
                          ' organisme basé à Bourges. \nOrganismes référencés et qualifiés dans le domaine d\'audit et d\'analyse.'),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- LISTE DES SOLUTIONS SUR MESURE ---
            Text(
              'Des solutions « sur mesure » sont proposées à nos clients, respectant le processus suivant :',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...processSteps.map((step) => ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, bottom: 8),
                  leading: Icon(Icons.check_circle, color: theme.primaryColor),
                  title: Text(step, style: bodyTextStyle),
                )),
            const SizedBox(height: 30),

            // --- DEUXIÈME IMAGE ---
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/21.jpg', // <-- Remplacez par le nom de votre deuxième image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(
                        child: Icon(Icons.image, color: Colors.grey, size: 50)),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // --- TEXTE DE CONCLUSION AVEC LIENS ---
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: bodyTextStyle,
                children: [
                  const TextSpan(
                      text: 'Les conseillers de CDO Formation et de '),
                  _linkTextSpan(
                      text: 'CAP SOCIETAL',
                      url: 'https://cap-societal.com/home',
                      context: context),
                  const TextSpan(
                      text:
                          ' sont à votre écoute pour étudier votre projet et vous proposer une solution adaptée, n\'hésitez pas à '),
                  _linkTextSpan(
                      text: 'nous contacter',
                      url: 'https://cdo-formation.fr/contact-v2.php',
                      context: context),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

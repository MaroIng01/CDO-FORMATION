// lib/pages/faq_page.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Les importations vers services_page et sous_services_page ont été supprimées car inutiles.

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  // Helper pour lancer les URLs
  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'ouvrir le lien : $url')),
      );
    }
  }

  // Helper pour afficher un message
  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // La fonction _navigateToSousServices a été supprimée car elle n'est plus utilisée.

  // Helper pour créer du texte cliquable
  TextSpan _linkTextSpan({
    required String text,
    VoidCallback? onTap,
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
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyTextStyle =
        theme.textTheme.bodyLarge?.copyWith(fontSize: 15, height: 1.6);
    final boldTextStyle = bodyTextStyle?.copyWith(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions/Réponses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Question 1
          _buildFaqTile(
            theme: theme,
            question:
                'Quelles sont les différentes prises en charge pour financer mon projet ?',
            answer: RichText(
              text: TextSpan(
                style: bodyTextStyle,
                children: const [
                  TextSpan(
                      text:
                          'La prise en charge dépend de votre statut : salarié ou demandeur d\'emploi ou particulier. Cette prise en charge n\'est pas automatique. elle dépend de plusieurs critères, qui sont propres à chaque organisme.\n\n'),
                  TextSpan(
                      text:
                          '1 - Si vous êtes salarié, vous avez la possibilité de prendre en charge votre formation dans le cadre du plan de formation par votre OPCA. pour cela rapprochez-vous de votre responsable formation. Le compte personnel de formation CPF. vérifier l\'éligibilité et votre compte. En tant que salarié vous pouvez aussi tenter le CIF (le congé individuel de formation)\n'),
                  TextSpan(
                      text:
                          '2 - Si vous êtes en profession libérale, rapprochez-vous du FIFPL (Fonds Interprofessionnel de Formation des Professionnels Libéraux)\n'),
                  TextSpan(
                      text:
                          '3 - Si vous êtes demandeur d\'emploi, rapprochez-vous de votre conseiller Pôle Emploi\n'),
                  TextSpan(
                      text:
                          '4 - En tant que particulier, vous pouvez financer vous même votre formation, dans ce cas n\'hesitez pas à nous contacter pour une facilité de paiement'),
                ],
              ),
            ),
          ),
          // Question 2
          _buildFaqTile(
            theme: theme,
            question:
                'Dans le cas d\'une recherche de stage pour le travail d\'intersession, puis-je bénificier d\'une convention ?',
            answer: Text(
              'Si le stage n\'est pas effectué dans votre entreprise, ou votre statut ne vous le permet pas, CDO FORMATION établi une convention de stage signé par les trois parties : CDO Formation, l\'entreprise qui vous accueille et vous même.\nCette convention vous sera transmise dès que vous nous avez indiqué: l\'entreprise d\'accueil et la période de stage.',
              style: bodyTextStyle,
            ),
          ),
          // Question 3
          _buildFaqTile(
            theme: theme,
            question:
                'Je souhaite m\'inscrire à la formation de formateur PRAP, quelles sont les modalités d\'inscription ?',
            answer: RichText(
              text: TextSpan(
                style: bodyTextStyle,
                children: [
                  const TextSpan(
                      text:
                          '1 - Dans un premier temps, nous envoyer la fiche d’inscription "CDO Formation" à télécharger sur notre site Internet afin de réserver votre place.\n\n'),
                  const TextSpan(
                      text:
                          '2 - Deux modules sont nécessaires à l’entrée en formation de formateurs PRAP: un module "prérequis bases en prévention" obligatoire pour le salarié, et un module " Assurer une bonne démarche PRAP dans l\'entreprise" recommandé pour le responsable\n\n'),
                  TextSpan(text: 'Pour le salarié : ', style: boldTextStyle),
                  const TextSpan(
                      text:
                          'Le module @01001 (Anciennement V000) A distance : « Acquérir des bases en prévention des risques professionnels » dispensé et pris en charge par l\'INRS. pour vous faciliter l\'inscription, nous vous conseillons de vous inscrire maintenant en téléchargeant la fiche d\'inscription et l\'envoyer à l\'INRS (coordonnées sur la fiche) '),
                  _linkTextSpan(
                      text: 'lien pour télécharger la fiche',
                      context: context,
                      onTap: () => _showMessage(
                          'Pas de fiche disponible pour le moment', context)),
                  const TextSpan(text: '\n\n'),
                  TextSpan(
                      text:
                          'Pour son responsable, voire son délégataire ou le commercial si Organisme de formation :\n',
                      style: boldTextStyle),
                  const TextSpan(
                      text:
                          'Le module RR2801 (anciennement G018) : Assurer les conditions de réussite d\'une formation-action en entreprise ou en établissement. Ce module ne conditionne pas l\'obtention du certificat de formateur PRAP ('),
                  _linkTextSpan(
                      text: 'plus d\'information et fiche d\'inscription',
                      context: context,
                      onTap: () => _showMessage(
                          'Page non disponible pour le moment', context)),
                  const TextSpan(text: ')'),
                ],
              ),
            ),
          ),
          // Question 4
          _buildFaqTile(
            theme: theme,
            question:
                'En quoi consite le travail d\'intersession, puis-je déja avoir quelques consignes pour préparer le stage ?',
            answer: RichText(
              text: TextSpan(
                style: bodyTextStyle,
                children: [
                  const TextSpan(text: 'Pour les formations de formateurs '),
                  // --- MODIFIÉ ICI ---
                  // Remplacé par un TextSpan normal avec un style gras
                  TextSpan(text: 'PRAP IBC/2SS ou CPS', style: boldTextStyle),
                  const TextSpan(
                      text:
                          ', deux travaux sont à réaliser pour valider les domaines de compétence 1 et 2.\n\n'),
                  const TextSpan(
                      text:
                          'Le travail intersession N°1, consiste à établir un diagnostic des indicateurs liés à la santé et securité au travail dans l\'entreprisre, d\'en faire une analyse et de proposer une démarche de prévention basée sur cette analyse en y intégrant les salariés à former.\n\n'),
                  const TextSpan(
                      text:
                          'Le travail intersession N°2, consite à réaliser une analyse d\'une situation de travail selon la méthodologie vue lors de la formation.\nVous pouvez demander les consignes à partir du moment ou vous avez confirmé votre inscription.'),
                ],
              ),
            ),
          ),
          // Question 5
          _buildFaqTile(
            theme: theme,
            question:
                'Avec mon certificat, puis-je former à l\'issue de ma formation ?',
            answer: Text(
              'Oui, sous condition que vous soyez rattaché à une entreprise habilitée ou un organisme de formation habilité.\nSi vous êtes indépendant, ou dépendant d’un organisme de formation, vous pouvez déposer votre demande d’habilitation via la CARSAT de votre région ou via la CRAMIF si vous êtes en Ile de France.',
              style: bodyTextStyle,
            ),
          ),
          const Divider(height: 30),
          // Contact final
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: bodyTextStyle,
              children: [
                const TextSpan(
                    text:
                        'Vous n\'avez pas trouvé la réponse à votre question ? N\'hésitez pas à '),
                _linkTextSpan(
                  text: 'nous contacter',
                  context: context,
                  onTap: () => _launchURL(
                      'https://cdo-formation.fr/contact-v2.php', context),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget pour construire chaque tuile de FAQ
  Widget _buildFaqTile({
    required ThemeData theme,
    required String question,
    required Widget answer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(
          question,
          style:
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        children: [answer],
      ),
    );
  }
}

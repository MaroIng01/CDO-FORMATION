// lib/pages/services_page.dart

import 'package:flutter/material.dart';
import '../models/service.dart';
import '../models/sous_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sous_services_page.dart';

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
            'CDO Formation est habilité par l\'INRS sous le N° : 222/2011/PRAPIBC-2/11 pour dispenser la formation de formateurs PRAP IBC, et sous le N° : 1498/2012/PRAP2S-2/11 pour dispenser la formation de formateurs PRAP 2S. \nConcernant la formation de formateurs SST, nous travaillons avec notre partenaire "MFC-03410" habilité sous le N° : 2492/2013/SST-2/02. Ce dernier assure la formation de nos clients',
        imagePath: 'lib/logos/reunion.jpg',
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=1',
        sousServices: [
          // Catégorie : Formations initiales
          SousService(
              name: 'Formation de formateur PRAP IBC',
              imagePath: 'lib/logos/image55.png',
              durationHours: '70 heures',
              durationDays: '10 j (en 3 sessions)',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-prap-ibc-591.html'),
          SousService(
              name: 'Formation de formateur PRAP 2S',
              imagePath: 'lib/logos/image55.png',
              durationHours: '98 heures',
              durationDays: '14 j en 3 sessions',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-prap-2s-593.html'),
          SousService(
              name: 'Formation de formateur Acteur Prévention ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '56 heures',
              durationDays: '8 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-acteur-prevention-asd-741.html'),
          SousService(
              name: 'Formation de formateur SST',
              imagePath: 'lib/logos/image55.png',
              durationHours: '56 heures',
              durationDays: '8 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-sst-596.html'),
          SousService(
              name: 'Formation de formateur CSE & CSSCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '35 heures',
              durationDays: '5 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-cse---cssct-725.html'),
          SousService(
              name: 'Formateur travail en hauteur et utilisation des EPI',
              imagePath: 'lib/logos/image55.png',
              durationHours: '35 heures',
              durationDays: '5 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formateur-travail-en-hauteur-et-utilisation-des-epi-790.html'),
          SousService(
              name: 'Formation de Formateurs AIRP',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateurs-aipr-756.html'),
          SousService(
              name: 'Assurer les conditions de réussite de la PRAP',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Assurer-les-conditions-de-reussite-de-la-prap-595.html'),
          SousService(
              name: 'Séminaire annuel des formateurs Réseau CDO',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Seminaire-annuel-des-formateurs-reseau-cdo-604.html'),
          SousService(
              name:
                  'Formation Directeurs dispositif AP SMS Animateur Prévention',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-directeurs-dispositif-ap-sms-animateur-prevention-721.html'),

          // Catégorie : Maintien et Actualisation des Compétences
          SousService(
              name: 'MAC Formateurs SST',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-formateurs-sst-597.html'),
          SousService(
              name: 'MAC Formateur PRAP IBC',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-formateur-prap-ibc-601.html'),
          SousService(
              name: 'MAC Fo PRAP 2S',
              imagePath: 'lib/logos/image55.png',
              durationHours: '28 heures',
              durationDays: '4 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-fo-prap-2s-744.html'),
          SousService(
              name: 'MAC Formateur Acteur Prévention ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-formateur-acteur-prevention--asd-742.html'),
          SousService(
              name: 'Complémentaire ALM pour Formateur PRAP 2S et APS ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '28 heures',
              durationDays: '4 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Complementaire-alm-pour-formateur-prap-2s-et-aps-asd-781.html'),

          // Catégorie : Formations complémentaires
          SousService(
              name: 'Passerelle Formateur PRAP IBC vers 2S Version ALM',
              imagePath: 'lib/logos/image55.png',
              durationHours: '42 heures',
              durationDays: '6 jours (4j + 2j)',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Passerelle-formateur--prap-ibc-vers-2s-version-alm-743.html'),
          SousService(
              name: 'Passerelle PAE3 vers Formateur SST',
              imagePath: 'lib/logos/image55.png',
              durationHours: '28 heures',
              durationDays: '4 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Passerelle-pae3-vers-formateur-sst-614.html'),
          SousService(
              name: 'Mobilisation des personnes niveau 1',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Mobilisation-des-personnes-niveau-1-623.html'),
          SousService(
              name: 'Acquérir les bases en prévention INRS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '20 heures',
              durationDays: '3 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Acquerir-les-bases-en-prevention-inrs-594.html'),
          SousService(
              name: 'S\'initier à la prévention des RPS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-S-initier-a-la-prevention-des-rps-616.html'),
          SousService(
              name:
                  'Le cadre juridique de la S&ST dans son role de résponsable',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Le-cadre-juridique-de-la-s-st-dans-son-role-de-responsable-606.html'),
        ]),
    Service(
        id: 2,
        name: 'Formation en partenariat avec la CARSAT CVL',
        description:
            'Formations réalisées en partenariat avec la CARSAT Centre Val de Loire',
        imagePath: 'lib/logos/reunion.jpg',
        sousServices: [
          SousService(
              name: 'Animateur Prévention AP SMS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '42 heures',
              durationDays: '6 jours + 2 demi-journées en établissement',
              category:
                  'Formations initiales animateurs et analyse des accidents',
              url:
                  'https://cdo-formation.fr/formation-Animateur-prevention--ap--sms-617.html'),
          SousService(
              name: 'Animateur Prévention AP ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours + 2 intersessions de 4H00',
              category:
                  'Formations initiales animateurs et analyse des accidents',
              url:
                  'https://cdo-formation.fr/formation-Animateur-prevention-ap-asd-580.html'),
          SousService(
              name: 'Analyser un accident du travail',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours (1j + 1j) + travail intersessions',
              category:
                  'Formations initiales animateurs et analyse des accidents',
              url:
                  'https://cdo-formation.fr/formation-Analyser-un-accident-du-travail-807.html'),
          SousService(
              name:
                  'MAC AP SMS - Maintien et actualisation des compétences Animateur prévention',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Maintien et actualisation des compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-ap-sms---maintien-et-actualisation-des-competences-animateur-prevention--783.html'),
          SousService(
              name: 'MAC AP ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Maintien et actualisation des compétences',
              url: 'https://cdo-formation.fr/formation-Mac-ap-asd-776.html'),
        ],
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=6'),
    Service(
        id: 3,
        name: 'Animateurs et Directeurs',
        description:
            'Un sauveteur secouriste du travail (ou SST) peut sauver des vies sur le lieu de travail, notamment en cas d’accident du travail. Il s’agit d’un membre du personnel ayant reçu l’instruction nécessaire pour donner les premiers secours en cas d’urgence et dans l’attente de l’arrivée des secours spécialisés. La présence de secouristes est obligatoire, selon l’article R. 4224-15 du Code du travail.',
        imagePath: 'lib/logos/reunion.jpg',
        sousServices: [
          //Formation initiales
          SousService(
              name: 'Animateur Prévention AP SMS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '42 heures',
              durationDays: '6 jours + 2 demi-journées en établissement',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Animateur-prevention--ap--sms-617.html'),

          SousService(
              name: 'Animateur Prévention AP ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours et 2 intersessions de 4H00',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Animateur-prevention-ap-asd-580.html'),

          SousService(
              name:
                  'Le role du responsable de secteur dans la démarche de prévention de sa structure',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Le-role-du-responsable-de-secteur-dans-la-demarche-de-prevention-de-sa-structure-771.html'),

          SousService(
              name:
                  'Formation Directeurs dispositif AP SMS Animateur Prévention',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-directeurs-dispositif-ap-sms-animateur-prevention-721.html'),

          SousService(
              name:
                  'Formation Directeurs dispositif AP ASD Animateur Prévention',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée + 2 intersessions',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-directeurs-dispositif-ap-asd-animateur-prevention-810.html'),

          SousService(
              name: 'Assurer les conditions de réussite de la PRAP',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Assurer-les-conditions-de-reussite-de-la-prap-595.html'),

          SousService(
              name: 'Formation de formateur PRAP 2S',
              imagePath: 'lib/logos/image55.png',
              durationHours: '98 heures',
              durationDays: '14 jours en 3 sessions',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateur-prap-2s-593.html'),

          SousService(
              name: 'S\'initier à la prévention des RPS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations initiales',
              url:
                  'https://cdo-formation.fr/formation-S-initier-a-la-prevention-des-rps-616.html'),

          //Maintien et Actualisation des compétences
          SousService(
              name:
                  'MAC AP SMS -Maintien et actualisation des compétences Animateur prévention-',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-ap-sms---maintien-et-actualisation-des-competences-animateur-prevention--783.html'),

          SousService(
              name: 'MAC Acteur APS ASD (titulaire de l\'option ALM)',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Mac-acteur-aps-asd-(titulaires-de-l-option-alm)-619.html'),

          SousService(
              name: 'Formation MAC PRAP IBC',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 jour',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Formation-mac-prap-ibc-622.html'),

          SousService(
              name: 'Maintien et actualisation des compétences PRAP 2S ALM',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Maintien-et-actualisation-des-competences-prap-2s-alm-621.html'),

          SousService(
              name: 'Acquérir lles bases en prévention INRS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '20 heures',
              durationDays: '3 jours',
              category: 'Maintien et Actualisation des Compétences',
              url:
                  'https://cdo-formation.fr/formation-Acquerir-les-bases-en-prevention-inrs-594.html'),
        ], // Vous pouvez ajouter des sous-formations ici
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=2'),
    Service(
        id: 4,
        name: 'CSE et CSSCT',
        description:
            'Constitué dans tous les établissements occupant au moins 50 salariés, le CHSCT a pour mission de contribuer à la protection de la santé et de la sécurité des salariés ainsi qu’à l’amélioration des conditions de travail. Le CHSCT dispose d’un certain nombre de moyens pour mener à bien sa mission (information, recours à un expert…) et les représentants du personnel disposent d’un crédit d’heures et d’une protection contre le licenciement. Ces moyens sont renforcés dans les entreprises à haut risque industriel. En l’absence de CHSCT, ce sont les délégués du personnel qui exercent les attributions normalement dévolues au comité.',
        imagePath: 'lib/logos/reunion.jpg',
        sousServices: [
          //Formations réglementaires des IRP
          SousService(
              name: 'Formation des membres CSSCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '35 heures',
              durationDays: '5 jours',
              category: 'Formations réglementaires des IRP',
              url:
                  'https://cdo-formation.fr/formation-Formation-des-membres-cssct-576.html'),

          SousService(
              name: 'Formation économique des élus CSE',
              imagePath: 'lib/logos/image55.png',
              durationHours: '28 heures',
              durationDays: '4 jours',
              category: 'Formations réglementaires des IRP',
              url:
                  'https://cdo-formation.fr/formation-Formation-economique-des-elus-cse-735.html'),

          SousService(
              name: 'Référent Harcèlement Sexuel & Agissements Sexistes',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations réglementaires des IRP',
              url:
                  'https://cdo-formation.fr/formation-Referent-harcelement-sexuel---agissements-sexistes-728.html'),

          SousService(
              name:
                  'Préparer & argumenter pour mieux convaincre face à la direction',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations réglementaires des IRP',
              url:
                  'https://cdo-formation.fr/formation-Preparer---argumenter-pour-mieux-convaincre--face-a-la-direction-762.html'),

          //Formations spécifiques
          SousService(
              name: 'Les essentiels de la QVCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations spécifiques',
              url:
                  'https://cdo-formation.fr/formation-Les-essentiels-de-la-qvct-799.html'),

          SousService(
              name: 'Le déploiement de la QVCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations spécifiques',
              url:
                  'https://cdo-formation.fr/formation-Le-deploiement-de-la-qvct-798.html'),

          SousService(
              name: 'Les bonnes pratiques QVCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations spécifiques',
              url:
                  'https://cdo-formation.fr/formation-Les-bonnes-pratiques-qvct-800.html'),

          SousService(
              name: 'Gestion de projet - QVCT',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations spécifiques',
              url:
                  'https://cdo-formation.fr/formation-Gestion-de-projet---qvct-802.html'),

          //Formation complémentaires
          SousService(
              name: 's\'initier à la prévention des RPS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-S-initier-a-la-prevention-des-rps-616.html'),

          SousService(
              name: 'Etablir son document unique',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Etablir-son-document-unique-572.html'),

          SousService(
              name: 'L\'analyse par la méthode de l\'arbre des causes',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-L-analyse-par-la-methode-de-l-arbre-des-causes-587.html'),

          SousService(
              name: 'Formation à l\'évaluation des risques professionnels',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Formations complémentaires',
              url:
                  'https://cdo-formation.fr/formation-Formation-a-l-evaluation-des-risques-professionnels-589.html'),

          SousService(
              name: 'Formation TMS: Comprendre et agir',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Formations complémentaires',
              url: ''),
        ], // Vous pouvez ajouter des sous-formations ici
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=4'),
    Service(
        id: 5,
        name: 'Salariés et autres publics',
        description:
            'La formation et l’information sont une obligation de l’employeur en matière de prévention des risques professionnels, elles concernent tous les salariés. Au-delà de leur caractère obligatoire, ces formations s’avèrent particulièrement profitables puisqu’en sensibilisant les salariés aux risques professionnels, elles permettent d’assurer la pérennité de l’entreprise en préservant le capital humain et en améliorant sa compétitivité.',
        imagePath: 'lib/logos/reunion.jpg',
        sousServices: [
          //Catégorie : AIPR - Risque électrique
          SousService(
              name: 'Formation acteur PRAP IBC',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-acteur-prap-ibc-574.html'),

          SousService(
              name: 'Formation MAC PRAP IBC',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-mac-prap-ibc-622.html'),

          SousService(
              name: 'Formation SST - Sauveteur Secouriste du Travail',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-sst---sauveteur-secouriste-du-travail-584.html'),

          SousService(
              name: 'MAC Maintien des compétences de SST',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Mac-maintien-des-competences-de-sst-585.html'),

          SousService(
              name: 'Formation PRAP 2S Sanitaire et Sociale',
              imagePath: 'lib/logos/image55.png',
              durationHours: '28 heures',
              durationDays: '4 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-prap-2s-sanitaire-et-sociale-573.html'),

          SousService(
              name: 'Maintien et actualisation des compétences PRAP 2S ALM',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Maintien-et-actualisation-des-competences-prap-2s-alm-621.html'),

          SousService(
              name: 'Formation Acteur Prévention ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-acteur-prevention-asd-592.html'),

          SousService(
              name: 'MAC Acteur APS ASD (titulaire de l\'option ALM)',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Mac-acteur-aps-asd-(titulaires-de-l-option-alm)-619.html'),

          SousService(
              name: 'MAC AP ASD',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url: 'https://cdo-formation.fr/formation-Mac-ap-asd-776.html'),

          SousService(
              name: 'Formation PRAP Acteur Option Bureau',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'AIPR - Risque électrique',
              url:
                  'https://cdo-formation.fr/formation-Formation-prap-acteur-option-bureau-618.html'),

          //Risques incendie
          SousService(
              name: 'Formation AIRP - Opérateur',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-aipr---operateur-750.html'),

          SousService(
              name: 'Formation AIRP Concepteur - Encadrant',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-aipr-concepteur---encadrant-747.html'),

          SousService(
              name: 'Formation de Formateurs AIRP',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-de-formateurs-aipr-756.html'),

          SousService(
              name: 'Formation à l\'habilitation H0 - H0V - B0',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-a-l-habilitation-h0---h0v---b0-581.html'),

          SousService(
              name:
                  'Habilitation électrique: Personnel électricien Basse Tension',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'Risques incendie',
              url: ''),

          SousService(
              name: 'Recyclage Habilitation électrique: Personnel électricien',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Risques incendie',
              url: ''),

          SousService(
              name: 'Sensibilisation aux risques chimiques V1',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Sensibilisation-aux-risques-chimiques--v1-577.html'),

          SousService(
              name: 'Manager, évaluer et prévenir les risques chimiques',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Manager-evaluer-et-prevenir-les-risques-chimiques-626.html'),

          SousService(
              name: 'Manager les risques chimiques par l\'outil SEIRICH',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Manager-les-risques-chimiques-par-l-outil-seirich-607.html'),

          SousService(
              name: 'S\'initier à la prévention des RPS',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-S-initier-a-la-prevention-des-rps-616.html'),

          SousService(
              name: 'Formation incendie: équipier premiers secours',
              imagePath: 'lib/logos/image55.png',
              durationHours: '3 heures',
              durationDays: '3,5 heures',
              category: 'Risques incendie',
              url: ''),

          SousService(
              name: 'Formation à l\'évacuation',
              imagePath: 'lib/logos/image55.png',
              durationHours: '4 heures',
              durationDays: '4 heures',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-a-l-evacuation-583.html'),

          SousService(
              name: 'Formation Guide File et Serre File (Evacuation)',
              imagePath: 'lib/logos/image55.png',
              durationHours: '4 heures',
              durationDays: '1/2 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Formation-guide-file-et-serre-file-(evacuation)-777.html'),

          SousService(
              name: 'Responsable évacuation incendie',
              imagePath: 'lib/logos/image55.png',
              durationHours: '3 heures',
              durationDays: '1/2 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Responsable-evacuation-incendie-754.html'),

          SousService(
              name: 'Maitriser l\'utilisation des Robinets d\'incendie Armés',
              imagePath: 'lib/logos/image55.png',
              durationHours: '3 heures',
              durationDays: '1/2 journée',
              category: 'Risques incendie',
              url:
                  'https://cdo-formation.fr/formation-Maitriser-l-utilisation-des-robinets-d-incendie-armes-753.html'),

          //Autres risques
          SousService(
              name:
                  'Attestation de formation aux gestes et soins d\'urgence niveau 1',
              imagePath: 'lib/logos/image55.png',
              durationHours: '14 heures',
              durationDays: '2 jours',
              category: 'Autres risques',
              url:
                  'https://cdo-formation.fr/formation-Attestation-de-formation-aux-gestes-et-soins-d-urgence-niveau-1-785.html'),

          SousService(
              name: 'Recyclage AFGSU 1',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Autres risques',
              url:
                  'https://cdo-formation.fr/formation-Recyclage-afgsu-1-787.html'),

          SousService(
              name: 'AFGSU 2',
              imagePath: 'lib/logos/image55.png',
              durationHours: '21 heures',
              durationDays: '3 jours',
              category: 'Autres risques',
              url: 'https://cdo-formation.fr/formation-Afgsu-2-786.html'),

          SousService(
              name: 'Recyclage AFGSU 2',
              imagePath: 'lib/logos/image55.png',
              durationHours: '7 heures',
              durationDays: '1 journée',
              category: 'Autres risques',
              url:
                  'https://cdo-formation.fr/formation-Recyclage-afgsu-2-788.html'),

          SousService(
              name: 'Prise en main de logiciel formadmin',
              imagePath: 'lib/logos/image55.png',
              durationHours: '2 heures',
              durationDays: '2 heures',
              category: 'Autres risques',
              url:
                  'https://cdo-formation.fr/formation-Prise-en-main-de-logiciel-formadmin-719.html'),

          SousService(
              name: 'Réunion d\'information Dispositif AP HAPA',
              imagePath: 'lib/logos/image55.png',
              durationHours: '1 journée',
              durationDays: '1 journée',
              category: 'Autres risques',
              url:
                  'https://cdo-formation.fr/formation-Reunion-d-information-dispositif-ap-hapa-613.html'),
        ], // Vous pouvez ajouter des sous-formations ici
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=3'),
  ];

  final List<Map<String, String>> externalLinks = [
    {
      'title': '📘 Notre catalogue de formation',
      'url': 'https://cdo-formation.fr/formations-liste-v2.php'
    },
    {
      'title': '📅 Sessions inter-entreprises',
      'url': 'https://cdo-formation.fr/sessions-v2.php'
    },
  ];

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Impossible d\'ouvrir le lien')));
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
                  onTap: () =>
                      setState(() => expandedIndex = isExpanded ? null : index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(service.imagePath,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 22),
                        color: const Color(0xFF2C3E50),
                        child: Text(
                          service.name,
                          style: theme.textTheme.headlineMedium
                              ?.copyWith(color: Colors.white, fontSize: 19),
                        ),
                      ),
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 20, 22, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(service.description ?? '',
                                  style: theme.textTheme.bodyLarge),
                              const SizedBox(height: 28),
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (service.sousServices.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SousServicesPage(service: service),
                                      ),
                                    );
                                  } else if (service.url != null) {
                                    openUrl(service.url!);
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 16),
                                label: Text(service.sousServices.isNotEmpty
                                    ? 'Voir les formations'
                                    : 'Plus d\'infos'),
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
                  title: Text(link['title']!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17)),
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

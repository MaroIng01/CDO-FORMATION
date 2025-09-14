// lib/data/services_data.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/formation.dart';

List<Formation> getFormations() {
  return [
    Formation(
        name: 'Formations de formateurs',
        description: 
        'CDO Formation est habilité par l\'INRS sous le N° : 222/2011/PRAPIBC-2/11 pour dispenser la formation de formateurs PRAP IBC, et sous le N° : 1498/2012/PRAP2S-2/11 pour dispenser la formation de formateurs PRAP 2S. \n'
        'Concernant la formation de formateurs SST, nous travaillons avec notre partenaire "MFC-03410" habilité sous le N° : 2492/2013/SST-2/02. Ce dernier assure la formation  de nos clients',
        icon: FontAwesomeIcons.chalkboardUser,
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=1',
        imagePath: 'lib/logos/image55.png'), // <-- Image ajoutée
    Formation(
        name: 'Formation avec la CARSAT CVL',
        description: 'Formations réalisées en partenariat avec la CARSAT Centre Val de Loire', // Votre description ici
        icon: FontAwesomeIcons.handshake,
        url: 'https://cdo-formation.fr/formations-v2.php?activeitem=6',
        imagePath: 'lib/logos/image55.png'), // <-- Image ajoutée
    Formation(
        name: 'Animateurs et Directeurs',
        description: 'Un sauveteur secouriste du travail (ou SST) peut sauver des vies sur le lieu de travail, notamment en cas d’accident du travail. Il s’agit d’un membre du personnel ayant reçu l’instruction nécessaire pour donner les premiers secours en cas d’urgence et dans l’attente de l’arrivée des secours spécialisés. La présence de secouristes est obligatoire, selon l’article R. 4224-15 du Code du travail.', // Votre description ici
        icon: FontAwesomeIcons.userTie,
        url:  'https://cdo-formation.fr/formations-v2.php?activeitem=2',
        imagePath: 'lib/logos/image55.png'), // <-- Image ajoutée
    Formation(
        name: 'CSE et CSSCT',
        description:  'Constitué dans tous les établissements occupant au moins 50 salariés, le CHSCT a pour mission de contribuer à la protection de la santé et de la sécurité des salariés ainsi qu’à l’amélioration des conditions de travail...', // Votre description ici
        icon: FontAwesomeIcons.users,
        url:  'https://cdo-formation.fr/formations-v2.php?activeitem=4',
        imagePath: 'lib/logos/image55.png'), // <-- Image ajoutée
    Formation(
        name: 'Salariés et autres publics',
        description:  'La formation et l’information sont une obligation de l’employeur en matière de prévention des risques professionnels...', // Votre description ici
        icon: FontAwesomeIcons.userGroup,
        url:  'https://cdo-formation.fr/formations-v2.php?activeitem=3',
        imagePath: 'lib/logos/image55.png'), // <-- Image ajoutée
  ];
}

final List<Map<String, String>> externalLinks = [
  // ... vos liens externes ...
];
import '../models/service.dart';
import '../models/sous_service.dart';

final List<Service> services = [
  Service(
    id: 1,
    name: 'Formations de formateurs',
    description: 'Description complète de la formation de formateurs',
    imagePath: 'lib/logos/formation_formateurs.jpg',
    sousServices: [
      SousService(name: 'Sous-service 1', url: 'https://exemple.com'),
      SousService(name: 'Sous-service 2', url: 'https://exemple.com'),
    ],
  ),
  Service(
    id: 2,
    name: 'Formation en partenariat avec la CARSAT CVL',
    description: 'Description formation en partenariat avec la CARSAT CVL',
    imagePath: 'lib/logos/carsat_cvl.jpg',
    sousServices: [],
  ),
];

import '../models/service.dart';

final List<Service> services = [
  Service(
    name: 'Développement Web',
    sousServices: [
      SousService(title: 'Site vitrine', url: 'https://example.com/site-vitrine'),
      SousService(title: 'E-commerce', url: 'https://example.com/e-commerce'),
    ],
  ),
  Service(
    name: 'Design Graphique',
    sousServices: [
      SousService(title: 'Logo', url: 'https://example.com/logo'),
      SousService(title: 'Charte graphique', url: 'https://example.com/charte'),
    ],
  ),
  Service(
    name: 'Marketing Digital',
    sousServices: [
      SousService(title: 'SEO', url: 'https://example.com/seo'),
      SousService(title: 'Campagnes Ads', url: 'https://example.com/ads'),
    ],
  ),
  Service(
    name: 'Développement Mobile',
    sousServices: [
      SousService(title: 'Application Android', url: 'https://example.com/android'),
      SousService(title: 'Application iOS', url: 'https://example.com/ios'),
    ],
  ),
];

// lib/models/service.dart

import 'sous_service.dart'; // Assure-toi que ce fichier existe aussi

class Service {
  final int id; // ajoute l'id si tu veux l'utiliser
  final String name;
  final String description;
  final String imagePath;
  final List<SousService> sousServices;
  final String? url;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.sousServices,
    this.url,
  });
}

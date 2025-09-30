// lib/models/sous_service.dart

class SousService {
  final String name;
  final String url;
  final String imagePath;
  final String durationHours;
  final String durationDays;
  final String category;

  SousService({
    required this.name,
    required this.url, // Le lien est bien obligatoire
    required this.imagePath,
    required this.durationHours,
    required this.durationDays,
    required this.category,
  });
}
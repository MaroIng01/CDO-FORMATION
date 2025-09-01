class Service {
  final int id;
  final String name;
  final String? description;
  final String imagePath;
  final List<dynamic> sousServices; 
  final String? url;

  Service({
    required this.id,
    required this.name,
    this.description,
    required this.imagePath,
    required this.sousServices,
    this.url,
  });
}

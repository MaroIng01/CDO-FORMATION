class Service {
  final String name;
  final List<SousService> sousServices;

  Service({required this.name, required this.sousServices});
}

class SousService {
  final String title;
  final String url;

  SousService({required this.title, required this.url});
}

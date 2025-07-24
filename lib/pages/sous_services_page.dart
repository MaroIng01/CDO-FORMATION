import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/service.dart';

class SousServicesPage extends StatelessWidget {
  final Service service;

  const SousServicesPage({super.key, required this.service});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Impossible d’ouvrir le lien';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.name)),
      body: ListView.builder(
        itemCount: service.sousServices.length,
        itemBuilder: (context, index) {
          final sousService = service.sousServices[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              title: Text(sousService.title),
              onTap: () => _launchURL(sousService.url),
            ),
          );
        },
      ),
    );
  }
}

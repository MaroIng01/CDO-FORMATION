import 'package:flutter/material.dart';
import '../models/service.dart';
import 'package:url_launcher/url_launcher.dart';

class SousServicesPage extends StatelessWidget {
  final Service service;

  const SousServicesPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),  // PAS de const ici
      ),
      body: ListView.builder(
        itemCount: service.sousServices.length,
        itemBuilder: (context, index) {
          final sousService = service.sousServices[index];
          return ListTile(  // PAS de const ici
            title: Text(sousService.name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final url = sousService.url;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Impossible d’ouvrir le lien')),
                );
              }
            },
          );
        },
      ),
    );
  }
}

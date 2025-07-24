import 'package:flutter/material.dart';
import '../models/service.dart';
import '../data/services_data.dart';
import 'sous_services_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nos Services')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              title: Text(service.name),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SousServicesPage(service: service),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

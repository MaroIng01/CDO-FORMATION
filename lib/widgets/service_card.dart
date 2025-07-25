import 'package:flutter/material.dart';
import '../models/service.dart';
import '../pages/sous_services_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatefulWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    return Card(
      color: Color(0xFF4c6c7b), // bleu-gris
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          if (service.url != null) {
            launchUrl(Uri.parse(service.url!));
          } else {
            setState(() {
              showDescription = !showDescription;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (service.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(service.imagePath!),
              ),
            Container(
              width: double.infinity,
              color: Color(0xFFbb2d3b), // rouge
              padding: const EdgeInsets.all(8),
              child: Text(
                service.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (showDescription && service.description != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.description!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SousServicesPage(service: service),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFFbb2d3b),
                      ),
                      child: const Text("Voir les formations"),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

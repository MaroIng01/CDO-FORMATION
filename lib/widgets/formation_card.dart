// lib/widgets/formation_card.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/formation.dart';

class FormationCard extends StatefulWidget {
  final Formation formation;

  const FormationCard({super.key, required this.formation});

  @override
  State<FormationCard> createState() => _FormationCardState();
}

class _FormationCardState extends State<FormationCard> {
  bool _isExpanded = false;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Impossible de lancer $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image en haut de la carte
              Image.asset(
                widget.formation.imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Contenu textuel avec padding
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          widget.formation.icon,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            widget.formation.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    // Section qui s'étend
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: Container(), // Widget vide quand c'est contracté
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.formation.description,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                            if (widget.formation.url != null && widget.formation.url!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => _launchURL(widget.formation.url!),
                                    child: const Text('Voir plus en détail'),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
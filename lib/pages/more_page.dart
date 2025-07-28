import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _showCoordinates = false;

  void _handleTap(BuildContext context, Map<String, dynamic> item) async {
    final Map<String, String> externalLinks = {
      'Audit et conseils': 'https://cdo-formation.fr/audit-v2.php',
      'Infos pratiques': 'https://cdo-formation.fr/infos-pratiques-v2.php',
      'FAQ': 'https://cdo-formation.fr/faq-v2.php',
      'Nous Contacter': 'https://cdo-formation.fr/contact-v2.php',
    };

    if (externalLinks.containsKey(item['title'])) {
      final Uri url = Uri.parse(externalLinks[item['title']]!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossible d’ouvrir le lien')),
        );
      }
    } else {
      Navigator.pushNamed(context, item['route']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> moreItems = [
      {
        'title': 'Audit et conseils',
        'icon': Icons.assignment,
        'route': '/audit',
      },
      {
        'title': 'Infos pratiques',
        'icon': Icons.info_outline,
        'route': '/infos',
      },
      {'title': 'FAQ', 'icon': Icons.help_outline, 'route': '/faq'},
      {
        'title': 'Nous Contacter',
        'icon': Icons.contact_mail,
        'route': '/contact',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalHeight =
                (moreItems.length + 1) * 80.0 + (moreItems.length) * 12.0 + (_showCoordinates ? 220 : 0);
            final topPadding = (constraints.maxHeight - totalHeight - 80) / 2;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: topPadding > 30 ? topPadding : 30),
                    Center(
                      child: Text(
                        'Plus',
                        style: TextStyle(
                          color: Color(0xFF2C3E50),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...moreItems.map((item) {
                      final bool isContact = item['title'] == 'Nous Contacter';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () => _handleTap(context, item),
                          borderRadius: BorderRadius.circular(18),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: isContact ? Color(0xFFbb2d3b) : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    item['icon'],
                                    color: isContact ? Colors.white : Color(0xFF4c6c7b),
                                    size: 26,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      item['title'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: isContact ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: isContact ? Colors.white70 : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    // Nouvelle carte "Nos coordonnées"
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _showCoordinates = !_showCoordinates;
                          });
                        },
                        borderRadius: BorderRadius.circular(18),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFF4c6c7b),
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 26,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    'Nos coordonnées',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                AnimatedRotation(
                                  turns: _showCoordinates ? 0.5 : 0,
                                  duration: Duration(milliseconds: 300),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white70,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Affichage des coordonnées si _showCoordinates est vrai
                    if (_showCoordinates)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF4c6c7b).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          '''CDO FORMATION SAS

4, rue du couvent
41200 Millançay
Tél : 02 54 96 02 60
Fax : 02 72 22 06 14
Portable : 06 30 82 18 84
contact@cdo-formation.fr
www.cdo-formation.fr

SIRET: 801 400 219 00011

APE: 8559A

N°OF: 24 41 01565 41''',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.4,
                            color: Color(0xFF4c6c7b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

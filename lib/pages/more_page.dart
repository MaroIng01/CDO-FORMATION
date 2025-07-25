import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des options "Plus"
    final List<Map<String, dynamic>> moreItems = [
      {
        'title': 'Audit et conseils',
        'icon': Icons.assignment, 
        'route': '/audit', // à définir dans tes routes ou gérer comme tu veux
      },
      {
        'title': 'Infos pratiques',
        'icon': Icons.info_outline,
        'route': '/infos',
      },
      {
        'title': 'FAQ',
        'icon': Icons.help_outline,
        'route': '/faq',
      },
      {
        'title': 'Nous Contacter',
        'icon': Icons.contact_mail,
        'route': '/contact',
      },
      // ajoute d'autres éléments si besoin
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plus'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4c6c7b),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: moreItems.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = moreItems[index];
          return ListTile(
            leading: Icon(item['icon'], color: const Color(0xFF4c6c7b)),
            title: Text(item['title']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Par exemple, navigation avec Navigator.pushNamed
              Navigator.pushNamed(context, item['route']);
            },
          );
        },
      ),
    );
  }
}

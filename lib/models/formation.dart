// lib/models/formation.dart

import 'package:flutter/material.dart';

class Formation {
  final String name;
  final String description;
  final IconData icon;
  final String? url;
  final String imagePath;

  Formation({
    required this.name,
    required this.description,
    required this.icon,
    this.url,
    required this.imagePath, 
  });
}
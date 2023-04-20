import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class Category {
  const Category({
    required this.name,
    required this.color,
    required this.id,
    required this.route,
  });

  final Color color;
  final int id;
  final String name;
  final Routes route;
}

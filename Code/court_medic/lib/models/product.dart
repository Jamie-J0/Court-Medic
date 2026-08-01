import 'package:flutter/material.dart';

class Product {
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const Product({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}

final List<Product> demoProducts = [
  Product(
    name: 'Bandages',
    icon: Icons.healing,
    color: const Color(0xFFE9C6A7),
    description: 'Sticky bandages to cover small cuts and scrapes and keep them clean.',
  ),
  Product(
    name: 'Medical cotton',
    icon: Icons.cloud,
    color: const Color(0xFFEDEDED),
    description: 'Soft cotton for cleaning wounds or applying antiseptic.',
  ),
  Product(
    name: 'Povidone-iodine',
    icon: Icons.opacity,
    color: const Color(0xFFE6A93D),
    description: 'An antiseptic solution used to disinfect cuts and scrapes.',
  ),
  Product(
    name: 'Elastic bandage',
    icon: Icons.linear_scale,
    color: const Color(0xFFB7A99A),
    description: 'A stretchy wrap used to support joints and reduce swelling.',
  ),
  Product(
    name: 'Instant ice pack',
    icon: Icons.ac_unit,
    color: const Color(0xFFAFD8E8),
    description: 'Squeeze to activate instant cold therapy for sprains and swelling.',
  ),
  Product(
    name: 'Scissors',
    icon: Icons.content_cut,
    color: const Color(0xFFB9C4D0),
    description: 'Small scissors for cutting tape, bandages, or clothing.',
  ),
  Product(
    name: 'Adhesive tape',
    icon: Icons.line_style,
    color: const Color(0xFFDCC9A6),
    description: 'Athletic tape used to support joints and secure dressings.',
  ),
  Product(
    name: 'Pain relief spray',
    icon: Icons.air,
    color: const Color(0xFFA9D6C5),
    description: 'Cooling spray to ease minor muscle pain on the go.',
  ),
];

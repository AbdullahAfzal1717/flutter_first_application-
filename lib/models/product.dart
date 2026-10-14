import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final IconData icon;
  final String category;
  final double rating;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
    required this.category,
    required this.rating,
  });
}

// Collection of dummy product objects
const List<Product> sampleProducts = [
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    price: 99.99,
    icon: Icons.headphones_rounded,
    category: 'Electronics',
    rating: 4.8,
  ),
  Product(
    id: 'p2',
    name: 'Smart Watch',
    price: 149.50,
    icon: Icons.watch_rounded,
    category: 'Wearables',
    rating: 4.6,
  ),
  Product(
    id: 'p3',
    name: 'Gaming Mouse',
    price: 45.00,
    icon: Icons.mouse_rounded,
    category: 'Accessories',
    rating: 4.5,
  ),
  Product(
    id: 'p4',
    name: 'Mechanical Keyboard',
    price: 120.00,
    icon: Icons.keyboard_rounded,
    category: 'Accessories',
    rating: 4.9,
  ),
  Product(
    id: 'p5',
    name: 'Bluetooth Speaker',
    price: 79.99,
    icon: Icons.speaker_rounded,
    category: 'Audio',
    rating: 4.4,
  ),
  Product(
    id: 'p6',
    name: 'HD Webcam',
    price: 59.90,
    icon: Icons.videocam_rounded,
    category: 'Electronics',
    rating: 4.3,
  ),
];
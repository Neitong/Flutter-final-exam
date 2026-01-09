// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  const StarsChip({
    super.key,
    required this.star,
  });

  final double star;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.star, size: 16, color: Colors.amber),
      label: Text(star.toStringAsFixed(1)),
    );
  }
}
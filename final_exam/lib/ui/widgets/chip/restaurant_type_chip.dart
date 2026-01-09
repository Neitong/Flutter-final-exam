// Widget to disaply a restaurant type chip
import 'package:flutter/material.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  const RestaurantTypeChip({
    super.key,
    required this.type,
  });

  final RestaurantType type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        Icons.restaurant,
        color: type.color,
      ),
      label: Text(
        type.name,
      ),
    );
  }

}


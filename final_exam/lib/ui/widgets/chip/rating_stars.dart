import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;

  const RatingStars({
    super.key,
    required this.rating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        return IconButton(
          onPressed: () => onChanged(starValue),
          icon: Icon(
            Icons.star,
            size: 40,
            color: starValue <= rating ? Colors.amber : Colors.grey[400],
          ),
        );
      }),
    );
  }
}
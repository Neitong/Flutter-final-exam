import 'package:flutter/material.dart';

import '../../../models/restaurant_comment.dart';
import '../chip/rating_stars.dart';

class BonusCommentForm extends StatefulWidget {
  const BonusCommentForm({super.key});

  @override
  State<BonusCommentForm> createState() => _BonusCommentFormState();
}

class _BonusCommentFormState extends State<BonusCommentForm> {
  int star = 0;
  final TextEditingController feedbackController = TextEditingController();
  String? errorMessage;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16, right: 16, top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("How was your dinner?", style: TextStyle(fontSize: 20)),
          RatingStars(
            rating: star,
            onChanged: (v) => setState(() => star = v),
          ),
          TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                labelText: "Feedback",
                errorText: errorMessage,
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, Comment(star: star, feedback: feedbackController.text)),
            child: const Text("COMMENT"),
          ),
        ],
      ),
    );
  }
}
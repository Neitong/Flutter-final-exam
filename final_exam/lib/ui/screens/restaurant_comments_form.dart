// YOUR CODE

import 'package:flutter/material.dart';

import '../../models/restaurant_comment.dart';
import '../widgets/chip/rating_stars.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({super.key});

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  int star = 0;
  final TextEditingController feedbackController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "How was your dinner?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RatingStars(
              rating: star,
              onChanged: (value) {
                setState(() {
                  star = value;
                });
              },
            ),

            const SizedBox(height: 12),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                labelText: "Feedback",
                errorText: errorMessage,
              ),
            ),
            const SizedBox(height: 16),


            ElevatedButton(
              onPressed: _submit,
              child: const Text("COMMENT"),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (feedbackController.text.isEmpty) {
      setState(() {
        errorMessage = "Feedback is required";
      });
      return;
    }



    Navigator.pop(
      context,
      Comment(
        star: star,
        feedback: feedbackController.text,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../../models/restaurant_comment.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import 'restaurant_comments_form.dart';
import '../widgets/chip/bonus_comment_form.dart';

class RestaurantCommentsView extends StatefulWidget {
  const RestaurantCommentsView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantCommentsView> createState() =>
      _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildCommentsList(),
        ],
      ),
      floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "normal",
          onPressed: _addCommentNormal,
          child: const Icon(Icons.list_alt),
        ),
        const SizedBox(height: 12),
        FloatingActionButton(
          heroTag: "bonus",
          backgroundColor: Colors.purple,
          onPressed: _addCommentBonus,
          child: const Icon(Icons.star_border_purple500),
        ),
      ],
    ),
    );
  }

  void _addCommentNormal() async {
  final Comment? comment = await showModalBottomSheet<Comment>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const CommentForm(), 
  );
  if (comment != null) setState(() => widget.restaurant.comments.add(comment));
}

void _addCommentBonus() async {
  final Comment? comment = await showModalBottomSheet<Comment>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const BonusCommentForm(), 
  );
  if (comment != null) setState(() => widget.restaurant.comments.add(comment));
}

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.main, 
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        children: [
          Text(
            widget.restaurant.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            widget.restaurant.address,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RestaurantTypeChip(type: widget.restaurant.type),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      widget.restaurant.averageRate.toStringAsFixed(1),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    if (widget.restaurant.comments.isEmpty) {
      return const Expanded(
        child: Center(child: Text("No comments yet")),
      );
    }

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: widget.restaurant.comments.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final comment = widget.restaurant.comments[index];
          return Card(
            elevation: 0,
            color: Colors.grey[100], 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: ListTile(
              title: Text(comment.feedback),
              trailing: Text(
                comment.star.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
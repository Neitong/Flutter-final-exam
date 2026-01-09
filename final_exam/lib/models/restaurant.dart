import 'restaurant_type.dart';
import 'restaurant_comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<Comment> comments = [];
 
  Restaurant({required this.name, required this.address, required this.type});

double get averageRate {
  if (comments.isEmpty) return 0.0;
  
  double total = comments.map((c) => c.star).reduce((a, b) => a + b).toDouble();
  return total / comments.length;
}
}

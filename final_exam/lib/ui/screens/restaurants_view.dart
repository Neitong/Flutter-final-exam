import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/restaurant_type.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import 'restaurant_comments_view.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool showOnlyKhmer = false;

  @override
  Widget build(BuildContext context) {
    final restaurants = showOnlyKhmer
        ? widget.restaurants
            .where((r) => r.type == RestaurantType.khmer)
            .toList()
        : widget.restaurants;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Column(
        children: [
          _buildFilter(),
          Expanded(child: _buildRestaurantList(restaurants)),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return Row(
      children: [
        Checkbox(
          value: showOnlyKhmer,
          onChanged: (value) {
            setState(() {
              showOnlyKhmer = value!;
            });
          },
        ),
        const Text("Show only Khmer restaurants"),
      ],
    );
  }

  Widget _buildRestaurantList(List<Restaurant> restaurants) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            title: Text(restaurant.name),
            subtitle: Row(
              children: [
                StarsChip(star: restaurant.averageRate),
                const SizedBox(width: 8),
                RestaurantTypeChip(type: restaurant.type),
              ],
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RestaurantCommentsView(restaurant: restaurant),
                ),
              );
              setState(() {
                
              });
            },
          ),
        );
      },
    );
  }
}

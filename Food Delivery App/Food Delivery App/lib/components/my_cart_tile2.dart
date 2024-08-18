import 'package:flutter/material.dart';
import '../models/food.dart';

class MyCartTile2 extends StatelessWidget {
  final Food food;
  final void Function()? onRemove;

  const MyCartTile2({
    super.key,
    required this.food,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(food.imagePath, width: 50, height: 50, fit: BoxFit.cover),
          ),
          title: Text(
            food.name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '${food.price} VND',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: onRemove,
          ),
        ),
      ),
    );
  }
}

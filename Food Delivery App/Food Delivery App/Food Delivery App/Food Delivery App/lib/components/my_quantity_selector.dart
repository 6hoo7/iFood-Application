import 'package:flutter/material.dart';

import '../models/food.dart';

class QuantitySelector extends StatelessWidget{
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecerment;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onDecerment,
    required this.onIncrement,
  });
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // decrease button
            GestureDetector(
              onTap: onDecerment,
              child: Icon(
                Icons.remove,
                size: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // quantity count
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 15,
                child: Center(
                  child: Text(
                    quantity.toString(),
                    )
                    ),
              ),
              ),
               GestureDetector(
              onTap: onIncrement,
              child: Icon(
                Icons.add,
                size: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
      ]),
    );
  }
}
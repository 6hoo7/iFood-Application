import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatefulWidget{
  final CartItem cartItem;
  const MyCartTile({super.key,required this.cartItem});

  @override
  State<MyCartTile> createState() => _MyCartTileState();
}

class _MyCartTileState extends State<MyCartTile> {
  @override
  Widget build(BuildContext context){
    return Consumer<Restaurant>(
      builder: (context,restaurant,child)=>Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hình ảnh món ăn
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  
                  const SizedBox(width: 10),
            
                  // Tên và giá
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tên món ăn 
                      Text(widget.cartItem.food.name),
                      // Gía món ăn
                      Text(widget.cartItem.food.price.toString() + 'VND',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // incerment or decrement quantity
                  QuantitySelector(quantity: widget.cartItem.quantity,
                   food: widget.cartItem.food,
                    onDecerment: (){
                      restaurant.removeFromCart(widget.cartItem);
                    },
                     onIncrement: (){
                      restaurant.addToCart(widget.cartItem.food, widget.cartItem.selectedAddons);
                     })
                ],),
            ),
            // Lựa chọn
            SizedBox(
              height: widget.cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                children: widget.cartItem.selectedAddons
                .map(
                  (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                    label: Row(
                      children: [
                        // Tên lựa chọn
                        Text(addon.name),
                  
                        // Gía lựa chọn
                        Text('(${addon.price}VND)'),
                      ],
                    ), 
                    shape: StadiumBorder(
                      side: BorderSide(
                        color:Theme.of(context).colorScheme.primary ) ),
                    onSelected: (value){},
                    backgroundColor: 
                    Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12,
                    ),
                    ),
                  ),
                  )
                  .toList(),
              ),
            )
        ]),
        ),);
  }
}

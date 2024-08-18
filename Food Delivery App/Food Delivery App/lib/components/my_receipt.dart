import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';


class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
        top: 50,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Đơn hàng của quý khách đã đặt thành công.",
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    
                    ),
                ),
                padding:  EdgeInsets.all(25),
                child: Consumer<Restaurant>(builder: (context, restaurant, child) => 
                Text(restaurant.displayCartReceicpt()) 
                ),
              ),
              const SizedBox(
                height: 25,
              ),
               Text("Thời gian giao hàng ước tính: 9:30 sáng"),
            ],
          ),
        ),
    );
  }
}
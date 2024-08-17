import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary);


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surface),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Phí giao hàng
          Column(
            children: [
              Text('15.000 VND',style: myPrimaryTextStyle,),
              Text('Phí giao hàng', style: mySecondaryTextStyle,),
          ],
          ),

          // Thời gian giao hàng
          Column(
            children: [
              Text('10-15 phút', style: myPrimaryTextStyle,),
              Text('Thời gian giao hàng', style: mySecondaryTextStyle,),
          ],
          ),

        ],
      ),
    );
  }
}
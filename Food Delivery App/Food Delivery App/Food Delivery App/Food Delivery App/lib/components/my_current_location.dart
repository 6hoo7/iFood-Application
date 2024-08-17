import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Địa chỉ của bạn."),
        content: const TextField(
          decoration:InputDecoration(hintText: "Tìm địa chỉ"),
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: ()=> Navigator.pop(context),
            child: const Text('Hủy'),
            ),

          // Save button
          MaterialButton(
            onPressed: ()=> Navigator.pop(context),
            child: const Text('Lưu'),
            ),

        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Giao hàng tại.",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
           ),
            GestureDetector(
              onTap: () => openLocationSearchBox(context),
              child: Row(
                children: [
                  // Địa chỉ
                  Text("238 Sư Vạn Hạnh , Quận 10, TPHCM",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  ),  
                  ),
                  // Drop down menu
                  const Icon(Icons.keyboard_arrow_down_rounded),
              ],
              ),
            ),
      ],
      ),
    );
  }
}
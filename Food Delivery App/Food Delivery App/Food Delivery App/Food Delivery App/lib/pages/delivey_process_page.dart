import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';

class DeliveyProcessPage extends StatelessWidget {
  const DeliveyProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đơn hàng",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      bottomNavigationBar: _buildBottomBar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  // Custom Bottom Nav Bar - Message / Call delivery driver.
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),

          SizedBox(width: 10),

          // driver detail
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Võ Công Minh",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Shipper",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          Spacer(),
          Row(
            children: [
              // message button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 10),
              // call button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

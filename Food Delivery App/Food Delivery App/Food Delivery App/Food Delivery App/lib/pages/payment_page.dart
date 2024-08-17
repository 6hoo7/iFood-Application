import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivey_process_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // User wants to pay
  void userTappedPay(){
    if (formKey.currentState!.validate()){
      // only show dialog if form is valid
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: const Text(
          "Xác nhận thanh toán",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
         ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Số thẻ: $cardNumber"),
                Text("Ngày hết hạn: $expiryDate"),
                Text("Chủ thẻ: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Hủy"),
              ),

            // Yes button
            TextButton(
              onPressed: () { 
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context)=> DeliveyProcessPage(),
                  ),
                  ); 
              },
              child: const Text("Đồng ý"),
              ),
          ],
        ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          "Thanh toán",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
         ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Bọc Column trong SingleChildScrollView
        child: Column(
          children: [
            //credit card
            CreditCardWidget(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              showBackView: isCvvFocused, 
              onCreditCardWidgetChange: (p0){},
            ),

            //credit card form
            CreditCardForm(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              }, 
              formKey: formKey,
            ),
            const SizedBox(height: 20), // Thêm khoảng cách để tránh lỗi tràn
            MyButton(
              onTap: userTappedPay,
              text: "Thanh toán ngay",
            ),
            const SizedBox(height: 20), // Thêm khoảng cách để tránh lỗi tràn
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons = {};
  
  FoodPage({
    super.key, 
    required this.food
    }){
      // initialize selected addons to be false
      for(Addon addon in food.availableAddons){
        selectedAddons[addon]= false;
      }
    }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  // method to add the cart  
  void addToCart(Food food, Map<Addon,bool> selectedAddons){

      // close the current food page to go back to menu
      Navigator.pop(context);
      
      // formart the selected addons 
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Scaffold UI
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text(widget.food.name),
          centerTitle: true,
        ),
      body:SingleChildScrollView(
        child: Column(
          children: [
      
            // food image
            Image.asset(widget.food.imagePath),
      
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // food name
              Text(widget.food.name, 
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 20,
                 ),
                 ),
                   // food price
              Text(
                '${widget.food.price}VND',
                  style: TextStyle(
                 fontSize: 16,
                 color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 10),

              // rating
                      RatingBar.builder(
                        initialRating: 4.5, // giả sử đánh giá là 4.5
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(height: 10),
              // Mô tả món ăn
              Text(widget.food.description),
      
                   const SizedBox(height: 10),
      
                  Divider(color:Theme.of(context).colorScheme.secondary),
              
                  const SizedBox(height: 10),
              //Những lựa chọn
               Text("Thêm lựa chọn",
                   style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                  ),      
                  const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(8),
                    ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index){
                    //get individual addon
                  
                    Addon addon = widget.food.availableAddons[index];
                        
                    // return check box UI
                  return CheckboxListTile(
                    title: Text(addon.name),
                    subtitle: Text('${addon.price}VND',
                    style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    ),
                    ),
                    value: widget.selectedAddons[addon], 
                    onChanged: (bool? value){
                      setState(() {
                        widget.selectedAddons[addon]= value!;
                      });
                    },
                    );
                },
                ),
              )
              ],),
            ),
      
            // button -> add to cart
            MyButton(
              onTap: () => addToCart(widget.food, widget.selectedAddons), 
            text: "Thêm vào giỏ hàng",
            ),
            const SizedBox(height: 25),
          ]),
      ),
        ),
    ],);
  }
}
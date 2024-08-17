// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/my_current_location.dart';
// import 'package:food_delivery_app/components/my_description_box.dart';
// import 'package:food_delivery_app/components/my_drawer.dart';
// import 'package:food_delivery_app/components/my_food_tile.dart';
// import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
// import 'package:food_delivery_app/components/my_tab_bar.dart';
// import 'package:food_delivery_app/models/food.dart';
// import 'package:food_delivery_app/models/restaurant.dart';
// import 'package:food_delivery_app/pages/account_page.dart';
// import 'package:food_delivery_app/pages/cart_page.dart';
// import 'package:food_delivery_app/pages/favorite_page.dart';
// import 'package:food_delivery_app/pages/food_page.dart';
// import 'package:food_delivery_app/pages/settings_page.dart';
// import 'package:provider/provider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

//   // Tab Controller
//   late TabController _tabController;
//   late PageController _pageController;
//   final myitems = [
//     Image.asset('lib/images/banner3.png0'),
//     Image.asset('lib/images/banner3.png'),
//     Image.asset('lib/images/banner3.png'),
//     Image.asset('lib/images/banner3.png'),
//     Image.asset('lib/images/banner3.png'),
//   ];
//   int myCurrentIndex = 0;

//   @override
//   void initState(){
//     super.initState();
//     _tabController =
//     TabController(length: FoodCategory.values.length, vsync: this);
//     _pageController = PageController();
//   }

//   @override
//   void dispose(){
//     _tabController.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   // Sort out and return a list of food items that belong to a specific category
//   List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
//     return fullMenu.where((food) => food.category == category).toList();
//   }

//   // Return list of foods in given category
//   List<Widget> getFoodInThisCategory(List<Food> fullMenu){
//     return FoodCategory.values.map((category) {

//       // Get category menu
//       List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
//       return ListView.builder(
//         itemCount: categoryMenu.length,
//         physics: const NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemBuilder: (context, index) {
//           // get individual food
//           final food = categoryMenu[index];

//           // Return food tile UI
//           return FoodTile(
//             food: food,
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodPage(food: food),
//             ),
//             ), onFavoriteTap: () {  },
//           );

//       });
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 50, // Điều chỉnh giá trị chiều cao
//         backgroundColor: Colors.transparent,
//         color: Theme.of(context).colorScheme.surface,
//         index: myCurrentIndex,
//         items: const [
//           Icon(Icons.home,color: Colors.white,),
//           Icon(Icons.shopping_cart,color: Colors.white,),
//           Icon(Icons.favorite,color: Colors.white,),
//           Icon(Icons.settings,color: Colors.white,),
//           Icon(Icons.person,color: Colors.white,),
//         ],
//         onTap: (index) {
//           setState(() => myCurrentIndex = index);
//           _pageController.jumpToPage(index);
//         },
//       ),

//       drawer: MyDrawer(),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             myCurrentIndex = index;
//           });
//         },
//         children: [
//           NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) => [
//               MySliverAppBar(
//                 title: MyTabBar(tabController: _tabController ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Divider(
//                       indent: 25,
//                       endIndent: 25,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                     // My current location
//                      MyCurrentLocation(),
//                     // Description box
//                     MyDescriptionBox(),
//                   ],
//                 ),
//               ),
//             ],
//             body: Consumer<Restaurant>(builder: (context, restaurant, child )=> TabBarView(
//               controller: _tabController,
//               children: getFoodInThisCategory(restaurant.menu),
//             ),
//             ),
//           ),
//           CartPage(),
//           FavoritePage(favoriteFoods: []),
//           SettingsPage(),
//           AccountPage(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/account_page.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/pages/favorite_page.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Tab Controller
  late TabController _tabController;
  late PageController _pageController;
  final myitems = [
    Image.asset('lib/images/banner3.png0'),
    Image.asset('lib/images/banner3.png'),
    Image.asset('lib/images/banner3.png'),
    Image.asset('lib/images/banner3.png'),
    Image.asset('lib/images/banner3.png'),
  ];
  int myCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // Get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // Return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
            onFavoriteTap: () {
              // Handle favorite tap
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50, // Điều chỉnh giá trị chiều cao
        backgroundColor: Colors.transparent,
        color: Theme.of(context).colorScheme.surface,
        index: myCurrentIndex,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          setState(() => myCurrentIndex = index);
          _pageController.jumpToPage(index);
        },
      ),
      drawer: MyDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            myCurrentIndex = index;
          });
        },
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MySliverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    // My current location
                    MyCurrentLocation(),
                    // Description box
                    MyDescriptionBox(),
                  ],
                ),
              ),
            ],
            body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
            ),
          ),
          CartPage(),
          FavoritePage(favoriteFoods: []),
          SettingsPage(),
          AccountPage(),
        ],
      ),
    );
  }
}

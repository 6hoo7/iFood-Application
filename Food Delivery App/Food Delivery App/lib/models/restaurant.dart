import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      imagePath: "lib/images/burger/cheese_burger.png",
      description:
          "Miếng thịt bò ngon ngọt với phô mai cheddar tan chảy, phô mai, cà chua và một chút hành tây và dưa chua.",
      name: "Hamburger truyền thống",
      price: 35000,
      availableAddons: [
        Addon(name: "Thêm phô mai", price: 10000),
        Addon(name: "Thịt xông khói", price: 20000),
        Addon(name: "Sốt", price: 5000),
      ],
      category: FoodCategory.Hamburger,
    ),
    Food(
      imagePath: "lib/images/burger/burger_bbq.jpg",
      description:
          "Có một chút hạt mè hoặc hành tây, cắt đôi và nướng, rau diếp, lát, thịt xông khói dải, nấu chín.",
      name: "Hamburger xông khói",
      price: 35000,
      availableAddons: [
        Addon(name: "Thêm phô mai", price: 10000),
        Addon(name: "Thịt xông khói", price: 20000),
        Addon(name: "Sốt", price: 5000),
      ],
      category: FoodCategory.Hamburger,
    ),
    Food(
      imagePath: "lib/images/burger/bbq_burger.png",
      description:
          "Những chiếc Burger BBQ này là sự bùng nổ ngon ngọt đáng kinh ngạc của vị ngọt, thơm, cay, khói, giòn cùng một lúc, được phủ trong nước sốt BBQ tự làm, phô mai cheddar sắc nét, thịt xông khói mặn, rau diếp giòn, cà chua ngon ngọt và dây hành tây giòn.",
      name: "Hamburger BBQ",
      price: 45000,
      availableAddons: [
        Addon(name: "Thêm phô mai", price: 10000),
        Addon(name: "Thịt xông khói", price: 20000),
        Addon(name: "Sốt", price: 5000),
      ],
      category: FoodCategory.Hamburger,
    ),
    Food(
      imagePath: "lib/images/burger/burger_garan.jpg",
      description: "Thịt xông khói, xà lách và cà chua.",
      name: "Hamburger gà rán",
      price: 35000,
      availableAddons: [
        Addon(name: "Thêm phô mai", price: 10000),
        Addon(name: "Thịt xông khói", price: 20000),
        Addon(name: "Sốt", price: 5000),
      ],
      category: FoodCategory.Hamburger,
    ),
    Food(
      imagePath: "lib/images/burger/burger_chay.jpg",
      description:
          "Rau, đậu đen, bài giảng, cà chua và một chút hành tây và dưa chua.",
      name: "Hamburger chay",
      price: 30000,
      availableAddons: [
        Addon(name: "cà chua", price: 5000),
        Addon(name: "Dưa chua", price: 5000),
        Addon(name: "Sốt", price: 5000),
      ],
      category: FoodCategory.Hamburger,
    ),

    // salads
    Food(
      imagePath: "lib/images/salads/asianesesame_salad.png",
      description:
          "Gồm đu đủ xanh, gỏi xoài Việt Nam và gỏi dưa leo kiểu Trung Quốc.",
      name: "Xà lách Châu Á",
      price: 20000,
      availableAddons: [
        Addon(name: "Xoài", price: 7000),
        Addon(name: "Đu đủ", price: 7000),
        Addon(name: "Sốt", price: 3000),
      ],
      category: FoodCategory.Salad,
    ),
    Food(
      imagePath: "lib/images/salads/caeser_salad.png",
      description:
          "Phô mai Parmesan, cắt nhỏ hoặc bào nhỏ kèm một chút hành tây và sốt caesar.",
      name: "Xà lách trộn sốt caesar",
      price: 30000,
      availableAddons: [
        Addon(name: "Phô mai parmesan", price: 7000),
        Addon(name: "Hành tây", price: 5000),
        Addon(name: "Sốt Caesar", price: 5000),
      ],
      category: FoodCategory.Salad,
    ),
    Food(
      imagePath: "lib/images/salads/greeks_salad.png",
      description:
          "Dưa chuột, cà chua, ớt chuông xanh, hành tím, ô liu và phô mai feta.",
      name: "Xà lách kiểu Hy Lạp",
      price: 40000,
      availableAddons: [
        Addon(name: "Phô mai feta", price: 10000),
        Addon(name: "Dưa chuột, cà chua", price: 10000),
        Addon(name: "Sốt", price: 10000),
      ],
      category: FoodCategory.Salad,
    ),
    Food(
      imagePath: "lib/images/salads/quinoa_salad.png",
      description: "Nước sốt Hoisin, nước cốt dừa và bơ đậu phộng.",
      name: "Xà lách sốt Hoisin",
      price: 25000,
      availableAddons: [
        Addon(name: "Nước cốt dừa", price: 5000),
        Addon(name: "Bơ đậu phộng", price: 7000),
        Addon(name: "Sốt Hoisin", price: 10000),
      ],
      category: FoodCategory.Salad,
    ),
    Food(
      imagePath: "lib/images/salads/southwest_salad.png",
      description:
          "Đậu đen, ngô ngọt, cà chua, phô mai, ớt chuông và sốt kem bơ ngò.",
      name: "Xà lách SouthWest",
      price: 30000,
      availableAddons: [
        Addon(name: "Phô mai", price: 10000),
        Addon(name: "Đậu đen, ngô ngọt, cà chua", price: 8000),
        Addon(name: "Sốt kem bơ ngò", price: 12000),
      ],
      category: FoodCategory.Salad,
    ),

    // sides
    Food(
      imagePath: "lib/images/sides/garlic_bread_side.png",
      description:
          "Món mì ống béo ngậy và bánh mặn tỏi là sự kết hợp tuyệt vời trên thiên đường.",
      name: "Bánh mặn tỏi",
      price: 25000,
      availableAddons: [
        Addon(name: "Mì ống", price: 10000),
        Addon(name: "Tỏi", price: 6000),
        Addon(name: "Sốt", price: 8000),
      ],
      category: FoodCategory.Banh_man,
    ),
    Food(
      imagePath: "lib/images/sides/loadedfries_side.png",
      description:
          "Khoai tây chiên đầy hương vị, kết hợp khoai tây chiên giòn với phô mai cheddar, thịt xông khói giòn và hành lá để tạo nên sự kết hợp hoàn hảo.",
      name: "Khoai tây chiên",
      price: 30000,
      availableAddons: [
        Addon(name: "Phô mai cheddar", price: 10000),
        Addon(name: "Thịt xông khói", price: 20000),
        Addon(name: "Sốt", price: 7000),
      ],
      category: FoodCategory.Banh_man,
    ),
    Food(
      imagePath: "lib/images/sides/mac_side.png",
      description:
          "Các món ăn phụ, hãy cân nhắc hương vị, kết cấu và nguyên liệu sẽ kết hợp hài hòa với hương vị đậm đà và béo ngậy của mac và phô mai.",
      name: "Mac Side",
      price: 25000,
      availableAddons: [
        Addon(name: "Phô mai", price: 10000),
        Addon(name: "Bacon", price: 199),
        Addon(name: "Sốt", price: 8000),
      ],
      category: FoodCategory.Banh_man,
    ),
    Food(
      imagePath: "lib/images/sides/onion_rings_side.png",
      description:
          "Các món ăn kèm tốt nhất để dùng kèm với hành tây chiên là phô mai Philly, khoai tây chiên, vỏ nhồi, súp đậu đen, nấm nhồi, ziti nướng, thịt bò stroganoff, hummus, thịt gà, gà viên biryani, salad Caesar, xà lách trộn, bánh mì yến mạch mật ong. , bánh mì tỏi, salad ngô kem và bánh mì kẹp thịt gà.",
      name: "Bánh mặn hành tây",
      price: 25000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 25000),
        Addon(name: "Bacon", price: 30000),
        Addon(name: "Avocado", price: 35000),
      ],
      category: FoodCategory.Banh_man,
    ),
    Food(
      imagePath: "lib/images/sides/sweet_side.png",
      description: "Dark chocolate, cocoa powder",
      name: "Sweet Side",
      price: 25000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 25000),
        Addon(name: "Bacon", price: 30000),
        Addon(name: "Avocado", price: 35000),
      ],
      category: FoodCategory.Banh_man,
    ),

    // desserts
    Food(
      imagePath: "lib/images/desserts/cake.png",
      description:
          "Đó là một chiếc bánh ngọt ngào, mềm mại với lớp phủ cobbler giòn đẹp mắt. Nướng ca cao.",
      name: "Bánh ngọt truyền thống",
      price: 25000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 25000),
        Addon(name: "Bacon", price: 30000),
        Addon(name: "Avocado", price: 35000),
      ],
      category: FoodCategory.Banh_ngot,
    ),
    Food(
      imagePath: "lib/images/desserts/chocolate_dessert.png",
      description:
          "Từ bánh pudding sô cô la sữa mịn và ngọt đến bánh sô cô la đen đậm đà và hơi đắng, những món ăn này luôn là sự lựa chọn an toàn.",
      name: "Bánh ngọt Socola",
      price: 30000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 30.000),
        Addon(name: "Bacon", price: 35.000),
        Addon(name: "Avocado", price: 45.000),
      ],
      category: FoodCategory.Banh_ngot,
    ),
    Food(
      imagePath: "lib/images/desserts/cupcake_dessert.png",
      description:
          "Bánh cupcake sô cô la và đổ Nutella vào để có được hương vị hạt dẻ sô cô la đặc trưng. Kem phủ kem làm bánh ngọt sô cô la là một bước nâng cao so với kem bơ truyền thống.",
      name: "Bánh ngọt Cupcake",
      price: 30000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 30000),
        Addon(name: "Bacon", price: 35000),
        Addon(name: "Avocado", price: 45000),
      ],
      category: FoodCategory.Banh_ngot,
    ),
    Food(
      imagePath: "lib/images/desserts/matcha_dessert.png",
      description:
          "Matcha là một loại trà xanh nổi tiếng của Nhật Bản với vị ngọt, đắng và hương cỏ. Khi nghiền thành bột, nó tạo nên một sự bổ sung ngoạn mục cho món tráng miệng.",
      name: "Bánh ngọt Matcha",
      price: 30000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 30000),
        Addon(name: "Bacon", price: 35000),
        Addon(name: "Avocado", price: 45000),
      ],
      category: FoodCategory.Banh_ngot,
    ),
    Food(
      imagePath: "lib/images/desserts/strawberry_dessert.png",
      description:
          "Bánh ngọt dâu tây là một loại bánh thường được làm với các nguyên liệu cơ bản như bột mì, đường, bơ, trứng và dâu tây.",
      name: "Bánh ngọt dâu tây",
      price: 30000,
      availableAddons: [
        Addon(name: "Extra cheese", price: 30000),
        Addon(name: "Bacon", price: 35000),
        Addon(name: "Avocado", price: 45000),
      ],
      category: FoodCategory.Banh_ngot,
    ),

    // drinks
    Food(
      imagePath: "lib/images/drinks/coca_drink.png",
      description:
          "Thức uống mang lại cảm giác sảng khoái, có vị Cola đặc biệt và một chút caffeine. Giúp bạn không chỉ cảm thấy sảng khoái mà còn khiến những giây phút nghỉ ngơi, ăn uống của bạn trở nên bất ngờ hơn đôi chút. ",
      name: "Coca Cola",
      price: 15000,
      availableAddons: [
        Addon(name: "Có đá", price: 15000),
        Addon(name: "Không đá", price: 20000),
        Addon(name: "Size lớn", price: 25000),
      ],
      category: FoodCategory.Nuoc,
    ),
    Food(
      imagePath: "lib/images/drinks/fanta_drink.png",
      description:
          "Nước ngọt có ga Fanta với hương vị trái cây phong phú, nhiều màu sắc giúp bạn sảng khoái và tận dụng tối đa những giây phút vui vẻ khi kết nối cùng bạn bè.",
      name: "Fanta",
      price: 20000,
      availableAddons: [
        Addon(name: "Có đá", price: 20000),
        Addon(name: "Không đá", price: 25000),
        Addon(name: "Size lớn", price: 30000),
      ],
      category: FoodCategory.Nuoc,
    ),
    Food(
      imagePath: "lib/images/drinks/monster_drink.png",
      description:
          "Sự kết hợp hoàn hảo của những nguyên liệu chất lượng đem đến một sản phẩm nước tăng lực Monster Energy tràn đầy năng lượng.",
      name: "Monster",
      price: 40000,
      availableAddons: [
        Addon(name: "Có đá", price: 40000),
        Addon(name: "Không đá", price: 45000),
        Addon(name: "Size lớn", price: 55000),
      ],
      category: FoodCategory.Nuoc,
    ),
    Food(
      imagePath: "lib/images/drinks/pep_drink.png",
      description:
          "Pepsi là thương hiệu nước giải khát có ga có hương vị Cola nổi tiếng toàn cầu.",
      name: "PEPSI",
      price: 15000,
      availableAddons: [
        Addon(name: "Có đá", price: 15000),
        Addon(name: "Không đá", price: 20000),
        Addon(name: "Size lớn", price: 25000),
      ],
      category: FoodCategory.Nuoc,
    ),
    Food(
      imagePath: "lib/images/drinks/sprite_drink.png",
      description:
          "Hương vị cổ điển, mát lạnh của chanh tươi, hoàn toàn không chứa caffeine, với 100% hương chanh tự nhiên.",
      name: "Sprite",
      price: 15000,
      availableAddons: [
        Addon(name: "Có đá", price: 15000),
        Addon(name: "Không đá", price: 20000),
        Addon(name: "Size lớn", price: 25000),
      ],
      category: FoodCategory.Nuoc,
    ),
  ];

  /*
  GETTERS
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  OPERATIONS
  */

  // use cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see id there is a cart item already with the same food and selected addons
    CartItem? cartitem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list  of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    // if item already exists, increase it's quantity
    if (cartitem != null) {
      cartitem.quantity++;
    }
    // otherwise , add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  HELPERS
  */

  //generate a receipt

  String displayCartReceicpt() {
    final receipt = StringBuffer();
    receipt.writeln("Đây là hóa đơn của bạn");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            " Thêm lựa chọn: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------------");
    receipt.writeln();
    receipt.writeln("Tổng số mục: ${getTotalItemCount()}");
    receipt.writeln("Tổng tiền: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)} VND";
  }

  //format list of addons into a string sumary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join();
  }
}

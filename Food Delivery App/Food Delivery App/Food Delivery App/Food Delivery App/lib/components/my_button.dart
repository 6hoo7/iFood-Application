// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   final Function()? onTap;
//   final String text;
//   const MyButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surface,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button pressed");
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

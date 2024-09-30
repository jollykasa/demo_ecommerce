import 'package:e_commerce_app/data/qty.dart';
import 'package:flutter/material.dart';

class CountButton extends StatefulWidget {
  const CountButton({super.key});

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  // Map productQuantity(products) {
  //   var quantity = Map();
  //   products.forEach((products) {
  //     if (!quantity.containsKey(products)) {
  //       quantity[products] = 1;
  //     } else {
  //       quantity[products] += 1;
  //     }
  //   });
  //   return quantity;
  // }
  void increament() {
    setState(() {
      qty++;
    });
  }

  void decreament() {
    setState(() {
      qty--;
    });
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          width: 40,
          height: 40,
          child: ClipOval(
              child: GestureDetector(
            onTap: () {
              decreament();
            },
            child:
                Container(color: Colors.white, child: Center(child: Text("➖"))),
          )),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          child: Text(qty.toString()),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(4),
          width: 40,
          height: 40,
          child: ClipOval(
              child: GestureDetector(
            onTap: () {
              increament();
            },
            child:
                Container(color: Colors.white, child: Center(child: Text("➕"))),
          )),
        ),
      ],
    );
  }
}

import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';

class CategoryCircle extends StatelessWidget {
  final String image;
  final String cateTitle;
  const CategoryCircle(
      {super.key, required this.image, required this.cateTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 3))
              ]),
          child: ClipOval(
              child: Center(
                  // Center the icon
                  child: Image.asset(
            "assets/images/" + image,
            width: 80,
            height: 65,
          ))),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            cateTitle,
            style: CataTitleTextStyle(),
          ),
        )
      ],
    );
  }
}

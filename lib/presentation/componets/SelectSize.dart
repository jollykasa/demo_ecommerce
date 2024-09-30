import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';

class SelectSize extends StatelessWidget {
  final String selectSize;
  const SelectSize({super.key, required this.selectSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Center(
        // Center the text
        child: Text(
          selectSize,
          style: CataTitleTextStyle(),
        ),
      ),
    );
  }
}

class SelectColor extends StatelessWidget {
  final Color? bgcolor;
  const SelectColor({
    super.key,
    this.bgcolor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: 50,
      height: 50,
      child: ClipOval(
        child: Container(
          color: bgcolor,
        ),
      ),
    );
  }
}

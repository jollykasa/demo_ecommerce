import 'dart:async';

import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

final List<String> imagePath = [
  "assets/images/pro1.jpg",
  "assets/images/pro2.webp",
  "assets/images/pro3.jpg",
  "assets/images/pro4.jpeg"
];
late List<Widget> _pages;
int _activePage = 0;

final PageController _pageController = PageController(initialPage: 0);
Timer? _timer;

class _CarouselSliderState extends State<CarouselSlider> {
  @override
  void initState() {
    super.initState();
    _pages = List.generate(imagePath.length,
        (index) => ImagePlaceHolder(imagePath: imagePath[index]));
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePath.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(seconds: 3), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(seconds: 3), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: PageView.builder(
                controller: _pageController,
                itemCount: imagePath.length,
                onPageChanged: (value) {
                  setState(() {
                    _activePage = value;
                  });
                },
                itemBuilder: (context, index) {
                  //return the image widget
                  return _pages[index];
                })),
        //for page indicator
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: _activePage == index
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ))),
          ),
        ),
        Container(
          height: 50,
          width: 100,
          child: Card(
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Center(
                child: Text(
              "Limited Time!",
              style: liTextStyle(),
            )),
          ),
        )
      ],
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}

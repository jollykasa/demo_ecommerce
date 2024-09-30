import 'package:e_commerce_app/presentation/componets/carousel_slider.dart';
import 'package:e_commerce_app/presentation/componets/categorycircle.dart';
import 'package:e_commerce_app/presentation/componets/header_home_screen.dart';

import 'package:e_commerce_app/presentation/screens/home/product_title_widget.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
// import 'package:badges/badges.dart' as badges;
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  //instance of the class
  final HomeBloc homeBloc = HomeBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Added To Cart")));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Added To Wishlist")));
        }
        //for bloc navigation
        // else if (state is HomeNavigateToProductDetailActionState) {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (newContext) => ProductDetailScreen(),
        //           settings: RouteSettings(arguments: successState.products)));
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              // body: Center(
              //   child: CircularProgressIndicator(),
              // ),
              // body: Center(
              //   child: Lottie.network(
              //       'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
              // ),
              body: Center(
                child: Lottie.asset('assets/images/animation.json'),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderHomeScreen(),
                      TweenAnimationBuilder(
                        child: Text("#SpecialForYou", style: stillTextStyle()),
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(seconds: 1),
                        builder: (context, value, child) {
                          return Opacity(opacity: value, child: child);
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CarouselSlider(),
                      const SizedBox(
                        height: 10,
                      ),
                      TweenAnimationBuilder(
                        child: Text("Category", style: stillTextStyle()),
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(seconds: 1),
                        builder: (context, value, child) {
                          return Opacity(opacity: value, child: child);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoryCircle(
                              cateTitle: 'Clothes',
                              image: "cloth.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCircle(
                              cateTitle: 'Electronics',
                              image: "electronics.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCircle(
                              cateTitle: 'Kitchen',
                              image: "kitchen.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCircle(
                              cateTitle: 'Shoes',
                              image: "shoes.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCircle(
                              cateTitle: 'Grocery',
                              image: "veg.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCircle(
                              cateTitle: 'Watch',
                              image: "watch.png",
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 3770,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: successState.products.length,
                              itemBuilder: (context, index) {
                                return ProductTitle(
                                  productDataModel:
                                      successState.products[index],
                                  homeBloc: homeBloc,
                                );
                              })),
                    ],
                  ),
                ),
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                  child: Text(
                "ERROR",
                style: errorTextStyle(),
              )),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}



// GridView.builder(
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2),
//                               itemCount: successState.products.length,
//                               itemBuilder: (context, index) {
//                                 return ProductTitle(
//                                   productDataModel:
//                                       successState.products[index],
//                                   homeBloc: homeBloc,
//                                 );
//                               })
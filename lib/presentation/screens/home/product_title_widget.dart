import 'package:e_commerce_app/presentation/screens/home/bloc/home_bloc.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:e_commerce_app/presentation/screens/productdetail/product_detail_screen.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTitle(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        hoverColor: Colors.redAccent,
        onTap: () {
          homeBloc.add(HomeProductDetailButtonNavigateEvent(
              clickedProducts: productDataModel));
          //passing value to the product detail
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(),
                  settings: RouteSettings(arguments: productDataModel)));
        },
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productDataModel.imageUrl))),
                ),
                Text(
                  productDataModel.name,
                  style: ProductNameTextStyle(),
                ),
                Text(
                  productDataModel.description,
                  style: ProductDesTextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ' + productDataModel.price.toString(),
                      style: ProductNameTextStyle(),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              homeBloc.add(
                                  HomeProductWishlistButtonClickedEvent(
                                      clickedProducts: productDataModel));
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {
                              homeBloc.add(HomeProductCartButtonClickedEvent(
                                  clickedProducts: productDataModel));
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

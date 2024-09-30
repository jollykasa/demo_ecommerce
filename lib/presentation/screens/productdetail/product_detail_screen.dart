import 'package:e_commerce_app/presentation/componets/SelectSize.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bloc/productdetail_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductdetailBloc productdetailBloc = ProductdetailBloc();
  @override
  Widget build(BuildContext context) {
    final ProductDataModel productDataModel =
        ModalRoute.of(context)!.settings.arguments as ProductDataModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: headTextStyle(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                productdetailBloc.add(ProductDetailWishlistButtonClickedEven(
                    clickedProduct: productDataModel));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Item Added To Wishlist")));
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 1),
                curve: Curves.easeInQuart,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                      color: Colors.amber,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productDataModel.imageUrl))),
                )),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(top: value * 15),
                      child: child,
                    ));
              },
              child: Text(productDataModel.name,
                  style: ProductNameDetailTextStyle()),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Total Price: \$ " + productDataModel.price.toString(),
                style: ProductDetailTextStyle()),
            const SizedBox(
              height: 10,
            ),
            Text("Products Details", style: total2TextStyle()),
            const SizedBox(
              height: 10,
            ),
            Text(
                productDataModel.description +
                    ". It's one of the " +
                    productDataModel.description +
                    " we discussed earlier, please let me know which product you'd like a description for. Alternatively, if it's a different product or category of products, please provide details such as the name of the product, its purpose, features, and any other relevant information. ",
                textAlign: TextAlign.justify,
                style: ProductDesTextStyle()),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text("Select Size", style: ProductDetailTextStyle()),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectSize(
                  selectSize: "S",
                ),
                SelectSize(
                  selectSize: "M",
                ),
                SelectSize(
                  selectSize: "L",
                ),
                SelectSize(
                  selectSize: "XL",
                ),
                SelectSize(
                  selectSize: "XXL",
                ),
                SelectSize(
                  selectSize: "XXXL",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Select Color: ',
                        style: ProductDetailTextStyle()),
                    const TextSpan(
                        text: 'Brown',
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  ]),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                SelectColor(
                  bgcolor: Colors.blue,
                ),
                SelectColor(
                  bgcolor: Colors.yellow,
                ),
                SelectColor(
                  bgcolor: Colors.red,
                ),
                SelectColor(
                  bgcolor: Colors.orange,
                ),
                SelectColor(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: double.maxFinite,
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    productdetailBloc.add(ProductDetailCartButtonClickedEven(
                        clickedProduct: productDataModel));
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item Added To Cart")));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Add to Cart",
                        style: ButtonTextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}

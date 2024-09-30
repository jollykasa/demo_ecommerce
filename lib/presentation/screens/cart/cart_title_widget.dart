import 'package:e_commerce_app/data/cart_items.dart';
import 'package:e_commerce_app/data/qty.dart';
import 'package:e_commerce_app/presentation/calculation/quantity.dart';
import 'package:e_commerce_app/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartTitle extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  CartTitle(
      {super.key, required this.productDataModel, required this.cartBloc});

  // total() {
  //   var total = 0.0;
  //   total = total + productDataModel.price;
  //   return total.toString();
  // }

  totalPrice() {
    double total = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      double p = productDataModel.price;
      double mul = p * qty;
      total = total + mul;
    }
    print(total.toString());
    return (total.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 6.5,
      child: Card(
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                totalPrice();
              },
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imageUrl))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    productDataModel.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Color: ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(text: 'Brown  '),
                          TextSpan(
                              text: 'Size: ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(text: 'Small'),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountButton(),
                      const SizedBox(
                        width: 55,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                cartBloc.add(CartRemovedFromCartEvent(
                                    productDataModel: productDataModel));
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






//cart with details:
//  return InkWell(
//       // onTap: () {
//       //   cartBloc.add(HomeProductDetailButtonNavigateEvent());
//       // },
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           elevation: 3,
//           color: Colors.white,
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(productDataModel.imageUrl))),
//                 ),
//                 Text(
//                   productDataModel.name,
//                   style: ProductNameTextStyle(),
//                 ),
//                 Text(
//                   productDataModel.description,
//                   style: ProductDesTextStyle(),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$ ' + productDataModel.price.toString(),
//                       style: ProductNameTextStyle(),
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               // homeBloc.add(
//                               //     HomeProductWishlistButtonClickedEvent(
//                               //         clickedProducts: productDataModel));
//                             },
//                             icon: Icon(
//                               Icons.favorite_border,
//                               color: Colors.black,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               cartBloc.add(CartRemovedFromCartEvent(
//                                   productDataModel: productDataModel));
//                             },
//                             icon: Icon(
//                               Icons.shopping_cart,
//                               color: Colors.black,
//                             )),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );


//qty update
// IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () {
//                             // setState(() {
//                             if (qty[int.parse(productDataModel.id)] > 0) {
//                               qty[int.parse(productDataModel.id)]--;
//                             }
//                             // });
//                           },
//                         ),
//                         Text(qty[int.parse(productDataModel.id)].toString()),
//                         IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             // setState(() {
//                             qty[int.parse(productDataModel.id)]++;
//                             // });
//                           },
//                         ),





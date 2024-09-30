import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:e_commerce_app/presentation/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTitle extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTitle(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 6.5,
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Color.fromARGB(255, 250, 213, 213),
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imageUrl))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        productDataModel.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
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
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 99, 97, 97))),
                              TextSpan(text: 'Brown  '),
                              TextSpan(
                                  text: 'Size: ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 99, 97, 97))),
                              TextSpan(text: 'Small'),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                wishlistBloc.add(WishlistRemoveFromWishlist(
                                    productDataModel: productDataModel));
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                              )),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}




//with details

// return InkWell(
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
//                               wishlistBloc.add(WishlistRemoveFromWishlist(
//                                   productDataModel: productDataModel));
//                             },
//                             icon: const Icon(
//                               Icons.favorite,
//                               color: Colors.black,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               // homeBloc.add(HomeProductCartButtonClickedEvent(
//                               //     clickedProducts: productDataModel));
//                             },
//                             icon: const Icon(
//                               Icons.shopping_cart_outlined,
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
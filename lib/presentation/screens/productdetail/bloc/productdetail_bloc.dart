import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/cart_items.dart';
import 'package:e_commerce_app/data/wishlist_items.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'productdetail_event.dart';
part 'productdetail_state.dart';

class ProductdetailBloc extends Bloc<ProductdetailEvent, ProductdetailState> {
  ProductdetailBloc() : super(ProductdetailInitial()) {
    on<ProductDetailWishlistButtonClickedEven>(
        productDetailWishlistButtonClickedEven);
    on<ProductDetailCartButtonClickedEven>(productDetailCartButtonClickedEven);
  }

  FutureOr<void> productDetailWishlistButtonClickedEven(
      ProductDetailWishlistButtonClickedEven event,
      Emitter<ProductdetailState> emit) {
    print("added to wishlist");
    wishlistItems.add(event.clickedProduct);
  }

  productDetailCartButtonClickedEven(ProductDetailCartButtonClickedEven event,
      Emitter<ProductdetailState> emit) {
    print(" Added to cart list");
    cartItems.add(event.clickedProduct);
  }
}

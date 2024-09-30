import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/cart_items.dart';
import 'package:e_commerce_app/data/ecommerce_data.dart';
import 'package:e_commerce_app/data/wishlist_items.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductDetailButtonNavigateEvent>(
        homeProductDetailButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        products: EcommerceData.eCommerceProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductDetailButtonNavigateEvent(
      HomeProductDetailButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Product Detail Clicked");
    print(event.clickedProducts.name);
    emit(HomeNavigateToProductDetailActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product Clicked");
    cartItems.add(event.clickedProducts);

    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product Clicked");
    wishlistItems.add(event.clickedProducts);
    emit(HomeProductItemWishlistedActionState());
  }
}

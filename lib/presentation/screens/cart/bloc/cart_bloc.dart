import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/cart_items.dart';
import 'package:e_commerce_app/presentation/screens/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemovedFromCartEvent>(cartRemovedFromCartEvent);
    on<CartOrderButtonNavigateEvent>(cartOrderButtonNavigateEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemovedFromCartEvent(
      CartRemovedFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartOrderButtonNavigateEvent(
      CartOrderButtonNavigateEvent event, Emitter<CartState> emit) {
    print("Order clicked");
    emit(CartNavigateToOrderActionState());
  }
}

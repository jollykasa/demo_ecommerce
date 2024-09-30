part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemovedFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemovedFromCartEvent({required this.productDataModel});
}

class CartOrderButtonNavigateEvent extends CartEvent {}

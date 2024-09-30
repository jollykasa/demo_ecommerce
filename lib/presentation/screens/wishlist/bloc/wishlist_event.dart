part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlist extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveFromWishlist({required this.productDataModel});
}

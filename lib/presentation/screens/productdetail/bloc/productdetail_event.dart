part of 'productdetail_bloc.dart';

@immutable
sealed class ProductdetailEvent {}

class ProductDetailWishlistButtonClickedEven extends ProductdetailEvent {
  final ProductDataModel clickedProduct;

  ProductDetailWishlistButtonClickedEven({required this.clickedProduct});
}

class ProductDetailCartButtonClickedEven extends ProductdetailEvent {
  final ProductDataModel clickedProduct;

  ProductDetailCartButtonClickedEven({required this.clickedProduct});
}

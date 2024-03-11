part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}
class ProductDetailedPageBuyButtonClickedEvent extends ProductDetailEvent {}

class ProductDetailedPageToCartPageNavigateButtonClickedEvent
    extends ProductDetailEvent {}
class ProductDetailedPageCartButtonClickedEvent extends ProductDetailEvent {
  final ProductDataModel clickedProduct;

  ProductDetailedPageCartButtonClickedEvent({required this.clickedProduct});
}

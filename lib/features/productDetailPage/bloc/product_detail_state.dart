part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}
sealed class ProductDetailActionState extends ProductDetailState{}

 class ProductDetailInitial extends ProductDetailState {}

class ProductDetailsPageAddToCartState extends  ProductDetailState {}


class ProductDetailsPageAddToCartActionState extends ProductDetailActionState {}

class ProductDetailsPageBuyNowActionState extends ProductDetailActionState {
  final String message;

  ProductDetailsPageBuyNowActionState({required this.message});

}

class ProductDetailsPageToCartPageNavigateActionState extends ProductDetailActionState {}



import 'dart:async';

import 'package:apni_dukan/data/cart_item.dart';
import 'package:apni_dukan/features/home/model/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ProductDetailedPageCartButtonClickedEvent>(
        productDetailedPageCartButtonClickedEvent);
    on<ProductDetailedPageToCartPageNavigateButtonClickedEvent>(
        productDetailedPageToCartPageNavigateButtonClickedEvent);
  }
  FutureOr<void> productDetailedPageCartButtonClickedEvent(
      ProductDetailedPageCartButtonClickedEvent event,
      Emitter<ProductDetailState> emit) {
    if (!cartItems.contains(event.clickedProduct)) {
      cartItems.add(event.clickedProduct);
    }
    emit(ProductDetailsPageAddToCartState());
    emit(ProductDetailsPageAddToCartActionState());
  }

  FutureOr<void> productDetailedPageToCartPageNavigateButtonClickedEvent(
      ProductDetailedPageToCartPageNavigateButtonClickedEvent event,
      Emitter<ProductDetailState> emit) {
    emit(ProductDetailsPageToCartPageNavigateActionState());
  }
}

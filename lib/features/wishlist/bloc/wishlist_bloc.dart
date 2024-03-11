import 'dart:async';

import 'package:apni_dukan/data/wishlist_item.dart';
import 'package:apni_dukan/features/home/model/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.product);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}

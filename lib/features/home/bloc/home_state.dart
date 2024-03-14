part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeBlocInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeNavigateToProfilePageActionState extends HomeActionState {}

class HomeNavigateToProductDetailsPageActionState extends HomeActionState {
  final ProductDataModel clickedProduct;

  HomeNavigateToProductDetailsPageActionState({required this.clickedProduct});
}

class HomeProductWhitelistedActionState extends HomeActionState {}

class HomeProductCartAddedActionState extends HomeActionState {}

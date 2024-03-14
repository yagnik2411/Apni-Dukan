import 'package:apni_dukan/features/cart/ui/cart.dart';
import 'package:apni_dukan/features/home/bloc/home_bloc.dart';
import 'package:apni_dukan/features/productDetailPage/ui/product_details_page.dart';
import 'package:apni_dukan/features/home/ui/product_tile.dart';
import 'package:apni_dukan/features/profile/ui/profile_page.dart';
import 'package:apni_dukan/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        } else if (state is HomeProductCartAddedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item Added in Cart")));
        } else if (state is HomeProductWhitelistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item Whitelisted")));
        } else if (state is HomeNavigateToProductDetailsPageActionState) {
          final successState = state;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                        product: successState.clickedProduct,
                      )));
        } else if(state is HomeNavigateToProfilePageActionState){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfilePage()));
        }
      },
      builder: (context, state) {
        print("state:${state.runtimeType}");
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              floatingActionButton: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal,
                child: IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
              ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Apni Dukan'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProfileButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.person_outline_rounded)),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    product: successState.products[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}


import 'package:apni_dukan/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:apni_dukan/features/wishlist/ui/wishlist_tile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc=WishlistBloc();

  @override
  void initState(){
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist Items")),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return successState.wishlistItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: successState.wishlistItems.length,
                      itemBuilder: (context, index) {
                        return WishlistTileWidget(
                            product: successState.wishlistItems[index],
                            wishlistBloc: wishlistBloc);
                      },
                    )
                  : const Center(
                      child: Text(
                        "No Items In Wishlist",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );

            default:
            return const SizedBox();
          }
        },
      ),
    );
  }
}



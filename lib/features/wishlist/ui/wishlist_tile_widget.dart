
import 'package:apni_dukan/features/home/model/home_product_data_model.dart';
import 'package:apni_dukan/features/wishlist/bloc/wishlist_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTileWidget extends StatelessWidget{
  final WishlistBloc wishlistBloc;
  final ProductDataModel product;

  const WishlistTileWidget({super.key, required this.wishlistBloc, required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.h),
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 1.h, blurRadius: 2.h)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            // margin: EdgeInsets.all(8.h),
            width: 350.h,
            height: 300.h,
            decoration: BoxDecoration(
                color: Colors.teal.shade100.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(7.w)),
                image: DecorationImage(
                    image: AssetImage(product.imageUrl), fit: BoxFit.contain)),
          ),
        ),
        20.verticalSpace,
        Text(
          product.name,
          style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.bold),
        ),
        Text(
          product.brand.name,
          style: const TextStyle(fontWeight: FontWeight.w200),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.h,
                            blurRadius: 2.h)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.h))),
                  child: IconButton(
                      onPressed: () {
                        wishlistBloc.add(
                            WishlistRemoveFromWishlistEvent(product: product));
                      },
                      icon: const Icon(Icons.favorite)),
                ),
                // 20.horizontalSpace,
                // Container(
                //   decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black12,
                //             spreadRadius: 2.h,
                //             blurRadius: 2.h)
                //       ],
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(25.h))),
                //   child: IconButton(
                //       onPressed: () {
                        
                //       },
                //       icon: const Icon(Icons.shopping_cart_outlined)),
                // ),
              ],
            )
          ],
        ),
      ]),
    );
  }

}
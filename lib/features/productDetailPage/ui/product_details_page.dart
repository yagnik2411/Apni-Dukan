import 'package:apni_dukan/features/cart/ui/cart.dart';
import 'package:apni_dukan/features/home/bloc/home_bloc.dart';
import 'package:apni_dukan/features/home/model/home_product_data_model.dart';
import 'package:apni_dukan/features/productDetailPage/bloc/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductDataModel product;
  final ProductDetailBloc productDetailBloc = ProductDetailBloc();

  ProductDetailsPage({super.key, required this.product});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.product.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.h,
                fontWeight: FontWeight.w400,
                color: Colors.teal.shade100),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.maxFinite.h,
          width: double.maxFinite.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.contain,
                height: 300.w,
                width: 300.w,
              ),
              Container(
                height: 350.h,
                padding: EdgeInsets.only(
                    left: 15.0.w, right: 15.0.w, top: 30.h, bottom: 10.h),
                width: double.maxFinite.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.h),
                        topRight: Radius.circular(50.h)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, -4))
                    ]),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                                fontSize: 30.h, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$${widget.product.price}",
                            style: TextStyle(
                                fontSize: 30.h, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    DescriptionBox(widget: widget),
                    10.verticalSpace,
                    const Divider(),
                    10.verticalSpace,
                    Text(
                      "Product Information",
                      style: TextStyle(
                          fontSize: 20.h, fontWeight: FontWeight.bold),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            widget.product.name,
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            widget.product.color,
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand Name",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            widget.product.brand.name,
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand Origin",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            widget.product.brand.origin,
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand Establish Year",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${widget.product.brand.establishedYear}",
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
              BottomBar(
                productDetailBloc: widget.productDetailBloc,
                product: widget.product,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final ProductDetailBloc productDetailBloc;
  final ProductDataModel product;
  const BottomBar({
    super.key,
    required this.productDetailBloc,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      bloc: productDetailBloc,
      listenWhen: (previous, current) => current is ProductDetailActionState,
      buildWhen: (previous, current) => current is! ProductDetailActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case ProductDetailsPageAddToCartActionState:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Added in Cart")));
            break;
          case ProductDetailsPageToCartPageNavigateActionState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
            break;
          case ProductDetailsPageBuyNowActionState:
            final successState = state as ProductDetailsPageBuyNowActionState;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(successState.message)));
            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductDetailsPageAddToCartState:
            return SizedBox(
              height: 70.h,
              width: 393.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      productDetailBloc.add(
                          ProductDetailedPageToCartPageNavigateButtonClickedEvent());
                    },
                    child: Container(
                      height: 50.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.h)),
                          color: Colors.white,
                          border: Border.all(color: Colors.teal.shade300)),
                      child: Center(
                        child: Text(
                          "Go To Cart",
                          style: TextStyle(
                              fontSize: 18.w,
                              color: Colors.teal.shade300,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        color: Colors.teal.shade300),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 18.w,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            );

          case ProductDetailInitial:
            return SizedBox(
              height: 70.h,
              width: 393.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      productDetailBloc.add(
                          ProductDetailedPageCartButtonClickedEvent(
                              clickedProduct: product));
                    },
                    child: Container(
                      height: 50.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.h)),
                          color: Colors.teal.shade300),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 18.w,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      productDetailBloc.add(
                          ProductDetailedPageBuyNowButtonClickedEvent(
                              ));
                    
                    },
                    child: Container(
                      height: 50.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.h)),
                          color: Colors.teal.shade300),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 18.w,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class DescriptionBox extends StatefulWidget {
  const DescriptionBox({
    super.key,
    required this.widget,
  });

  final ProductDetailsPage widget;

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  bool detailedDescription = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: detailedDescription,
      replacement: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.widget.product.detailedDescription,
              style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.normal),
            ),
            GestureDetector(
              onTap: () {
                detailedDescription = true;
                setState(() {});
              },
              child: Text(
                " Show less",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.normal,
                    color: Colors.teal.shade300),
              ),
            ),
          ],
        ),
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.widget.product.description,
              style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.normal),
            ),
            GestureDetector(
              onTap: () {
                detailedDescription = false;
                setState(() {});
              },
              child: Text(
                " Show More",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.normal,
                    color: Colors.teal.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

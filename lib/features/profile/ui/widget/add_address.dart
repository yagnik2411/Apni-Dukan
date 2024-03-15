import 'package:apni_dukan/features/profile/bloc/profile_bloc.dart';
import 'package:apni_dukan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddress extends StatelessWidget {
  AddAddress({
    super.key,
    required this.profileBloc,
  });
  final ProfileBloc profileBloc;
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              200.verticalSpace,
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Flat no. 123, Street 1",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an Address';
                    }

                    return null;
                  },
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "ABC",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "City",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a City';
                    }

                    return null;
                  },
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "ABC",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "State",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a State';
                    }

                    return null;
                  },
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextFormField(
                  controller: pinCodeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "123456",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Pin Code",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a PIN code';
                    }

                    // Regular expression to match a typical PIN code pattern
                    // You may need to adjust this pattern according to your specific requirements
                    RegExp pinCodeRegex =
                        RegExp(r'^\d{6}$'); // Assumes a 6-digit PIN code format

                    if (!pinCodeRegex.hasMatch(value)) {
                      return 'Please enter a valid PIN code'; // You can customize this error message
                    }

                    return null;
                  },
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: 200.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      globalAddress?.setAllParameters(
                        address: addressController.text,
                        city: cityController.text,
                        state: stateController.text,
                        pinCode: pinCodeController.text,
                      );
                      profileBloc.add(
                          ProfileAddressPageAddAddressButtonClickedEvent());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Add Address",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.teal.shade400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

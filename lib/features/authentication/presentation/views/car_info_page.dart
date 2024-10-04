import 'package:bot_toast/bot_toast.dart';
import 'package:campus_go_drivers/core/constants/constants.dart';
import 'package:campus_go_drivers/core/theme/theme.dart';
import 'package:campus_go_drivers/features/authentication/presentation/views/login.dart';
import 'package:campus_go_drivers/features/authentication/presentation/views/loginpage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/primarybutton.dart';
import '../../../../global/global.dart';
import '../../../home/presentation/pages/main_screen.dart';

class CarInfoPage extends StatefulWidget {
  static String routeName = 'CarInfoPage';
  const CarInfoPage({super.key});

  @override
  State<CarInfoPage> createState() => _CarInfoPageState();
}

class _CarInfoPageState extends State<CarInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _carNumberController = TextEditingController();
  final TextEditingController _carColorController = TextEditingController();
  List<String> carTypes = ['Private', 'Shared', 'Commercial'];
  bool _isLoading = false;
  String? _carType;
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map driverCarInfoMap = {
        'car_model': _carModelController.text.trim(),
        'car_number': _carNumberController.text.trim(),
        'car_color': _carColorController.text.trim(),
      };
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('drivers');
      userRef
          .child(currentUser!.uid)
          .child('car_details')
          .set(driverCarInfoMap);
      BotToast.showSimpleNotification(title: 'Car details have been saved');
      Navigator.pushReplacementNamed(context, LoginRegister.routeName);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(kRidee),
            Text(
              'Add Car Details',
              style: theme(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kPrimaryColor2, fontSize: 25.sp),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Car Model',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      controller: _carModelController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 16.sp),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Car Model',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter car model';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Car Number',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      controller: _carNumberController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                      decoration:
                          const InputDecoration(hintText: 'Enter Car Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter car number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Car Color',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      controller: _carColorController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 16.sp),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter car color',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter car color';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Car Type',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                      elevation: 0,
                      itemHeight: 60.h,

                      //isExpanded: true,
                      value: _carType,
                      onChanged: (newValue) {
                        setState(() {
                          _carType = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Select car type',
                      ),
                      items: carTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your gender';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PrimaryButton(
                      isLoading: _isLoading,
                      text: 'Continue',
                      onPressed: () => _submitForm(),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

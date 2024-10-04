import 'package:campus_go_drivers/features/authentication/presentation/views/car_info_page.dart';
import 'package:campus_go_drivers/features/home/presentation/pages/main_screen.dart';
import 'package:flutter/widgets.dart';

import '../../features/authentication/presentation/views/createpassword.dart';
import '../../features/authentication/presentation/views/forgot_password.dart';
import '../../features/authentication/presentation/views/login.dart';
import '../../features/authentication/presentation/views/loginpage.dart';
import '../../features/authentication/presentation/views/otp_verification.dart';
import '../../features/authentication/presentation/views/register.dart';

import '../../features/menu/presentation/pages/promo.dart';
import '../../features/menu/presentation/pages/promo_page.dart';
import '../../features/onboarding/presentation/views/onboarding.dart';
import '../../features/onboarding/presentation/views/splash_screen.dart';
import '../../features/profile/presentation/pages/change_password.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/ride/presentation/pages/calendar.dart';
import '../../features/ride/presentation/pages/my_ride.dart';
import '../../features/ride/presentation/pages/options_page.dart';
import '../widgets/success_page.dart';

Map<String, WidgetBuilder> routes = {
  //all screens here
  //Home.routeName: (context) => const Home(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  LoginRegister.routeName: (context) => const LoginRegister(),
  RegistrationPage.routeName: (context) => const RegistrationPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  CreatePassword.routeName: (context) => const CreatePassword(),
  OtpVerification.routeName: (context) => const OtpVerification(),
  SuccessPage.routeName: (context) => const SuccessPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  OptionsPage.routeName: (context) => const OptionsPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  ChangePasswordPage.routeName: (context) => const ChangePasswordPage(),
  SelectDatePage.routeName: (context) => const SelectDatePage(),
  PromoPage.routeName: (context) => const PromoPage(),
  PromoCodePage.routeName: (context) => const PromoCodePage(),
  MyRidesPage.routeName: (context) => const MyRidesPage(),
  MainScreenPage.routeName: (context) => const MainScreenPage(),
  CarInfoPage.routeName: (context) => const CarInfoPage(),
};

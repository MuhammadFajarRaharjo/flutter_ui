import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chart/chart_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chart/checkout_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chart/checkout_success_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chat/chat_room.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/main_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/profile/edit_profile_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/product/product_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/signin/sing_in_screen.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

import '../screens/signup/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> route(RouteSettings settings) {
    // final arg = settings.arguments;

    switch (settings.name) {
      case RouteName.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteName.chatRoom:
        return MaterialPageRoute(builder: (_) => const ChatRoom());
      case RouteName.chart:
        return MaterialPageRoute(builder: (_) => ChartScreen());
      case RouteName.checkoutDetails:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case RouteName.checkoutSuccess:
        return MaterialPageRoute(builder: (_) => const CheckoutSuccessScreen());
      case RouteName.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RouteName.product:
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'Page Not Found',
            style: AppStyle.poppinsSemiBold
                .copyWith(fontSize: BoxSize.size24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

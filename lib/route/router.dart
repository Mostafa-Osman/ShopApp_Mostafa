import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/shop_layout.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';
import 'package:udemy_flutter/screens/home/ui/home.dart';
import 'package:udemy_flutter/screens/login/ui/login.dart';
import 'package:udemy_flutter/screens/my_bag/ui/my_bag_screen.dart';
import 'package:udemy_flutter/screens/end_orders/ui/my_orders.dart';
import 'package:udemy_flutter/screens/notifications/ui/notifications_screen.dart';
import 'package:udemy_flutter/screens/on_boarding/ui/on_boarding.dart';
import 'package:udemy_flutter/screens/payment/ui/payment.dart';
import 'package:udemy_flutter/screens/product_details/ui/product_details.dart';
import 'package:udemy_flutter/screens/profile/ui/profile.dart';
import 'package:udemy_flutter/screens/register/ui/register.dart';
import 'package:udemy_flutter/screens/search/ui/search.dart';
import 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RouteConstant.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstant.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // case RouteConstant.phoneNumberRoute:
      //   return MaterialPageRoute(builder: (_) => PhoneNumberScreen());
      // case RouteConstant.resetPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteConstant.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstant.notificationsRoute:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case RouteConstant.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case RouteConstant.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteConstant.myBagRoute:
        return MaterialPageRoute(builder: (_) => MyBagScreen());
      case RouteConstant.myOrderRoute:
        return MaterialPageRoute(builder: (_) => MyOrderScreen());
      case RouteConstant.productDetailsRoute:
        return MaterialPageRoute(builder: (_) {
          final DetailsData arguments = settings.arguments as DetailsData;

          return ProductDetailsScreen(productDetails: arguments);
        });
      case RouteConstant.shopLayoutRoute:
        return MaterialPageRoute(builder: (_) => ShopLayout());
      case RouteConstant.paymentRoute:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      // case RouteConstant.verifyRoute:
      //   return MaterialPageRoute(builder: (_) {
      //     final bool arguments = settings.arguments as bool;
      //     var isFromResetPhone = arguments;
      //
      //     return VerifyMobileScreen(isFromResetPhone: isFromResetPhone);
      //   });
      // case RouteConstant.replyCommentRoute:
      //   return MaterialPageRoute(builder: (_) {
      //     final CommentArguments arguments =
      //         settings.arguments as CommentArguments;
      //     var details = arguments;
      //     return ReplyCommentScreen(details: details);
      //   });

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

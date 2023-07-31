import 'package:flutter/material.dart';
import 'package:sustainable_world/ui/views/authentication/authentication_view.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_details/campaign_details_view.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_view.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_view.dart';
import 'package:sustainable_world/ui/views/home/home_view.dart';
import 'package:sustainable_world/ui/views/initialization/initialization_view.dart';
import 'package:sustainable_world/ui/views/orders/orders_view.dart';
import 'package:sustainable_world/ui/views/payment/payment_view.dart';
import 'package:sustainable_world/ui/views/notification/notification_view.dart';
import 'package:sustainable_world/ui/views/payment_success/payment_success_view.dart';
import 'package:sustainable_world/ui/views/product_details/product_details_view.dart';
import 'package:sustainable_world/ui/views/search/search_view.dart';
import 'package:sustainable_world/ui/views/settings/settings_view.dart';
import 'package:sustainable_world/ui/views/sign_up/sign_up_view.dart';
import 'package:sustainable_world/ui/views/your_offers/your_offers_view.dart';

class AppRouter {
  AppRouter._();

  static Map<String, Widget Function(BuildContext)> routes = {
    InitializationView.routeName: (context) => const InitializationView(),
    AuthenticationView.routeName: (context) => const AuthenticationView(),
    SignUpView.routeName: (context) => const SignUpView(),
    HomeView.routeName: (context) => const HomeView(),
    DisposeFormView.routeName: (context) => const DisposeFormView(),
    SettingsView.routeName: (context) => const SettingsView(),
    YourOffers.routeName: (context) => const YourOffers(),
    PaymentView.routeName: (context) => const PaymentView(),
    NotificationView.routeName: (context) => const NotificationView(),
    SearchView.routeName: (context) => const SearchView(),
    ProductDetailsView.routeName: (context) => const ProductDetailsView(),
    PaymentSuccessView.routeName: (context) => const PaymentSuccessView(),
    OrdersView.routeName: (context) => const OrdersView(),
    CampaignDetailsView.routeName: (context) => const CampaignDetailsView(),
    CampaignView.routeName: (context) => const CampaignView()
  };

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return null;
  }
}

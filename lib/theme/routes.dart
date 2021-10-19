import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/auth/login_view.dart';
import 'package:flutter_application_1/views/auth/register_view.dart';
import 'package:flutter_application_1/views/product_list_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/auth-login';
  static const String register = '/auth-register';
  static const String productList = '/product-list';

  static Map<String, WidgetBuilder> define() {
    return {
      login: (context) => const Login(),
      register: (context) => const Register(),
      productList: (context) => const ProductList(),
    };
  }
}

import 'package:dice_master/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    return authController.isAuthenticated() || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }
}

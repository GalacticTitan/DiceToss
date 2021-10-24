import 'package:dice_master/middlewares/auth_middleware.dart';
import 'package:dice_master/translations/pre_translation.dart';
import 'package:dice_master/views/dice/dice_view.dart';
import 'package:dice_master/views/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'views/scoreboard/score_board.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(GetMaterialApp(
    translations: PreTranslations(),
    locale: const Locale('en', 'US'),
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => const DiceView(),
        middlewares: [AuthMiddleWare()],
      ),
      GetPage(
        name: '/login',
        page: () => const Login(),
      ),
      GetPage(
        name: '/score-board',
        page: () => const ScoreBoard(),
      ),
    ],
  ));
}

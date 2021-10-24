import 'package:dice_master/views/dice/dice_view.dart';
import 'package:dice_master/views/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var data = {};
  var _authenticated = false;
  var version = '0'.obs;

  void signIn() async {
    try {
      isLoading.toggle();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: data['email'], password: data['password']);
      _authenticated = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("invalid_user".tr,
            'user_not_found'.tr,
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("wrong_password".tr, 'wrong_password_desc'.tr,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.toggle();
    }
    if (FirebaseAuth.instance.currentUser != null) {
      Get.off(const DiceView());
    }
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    Get.offAll(const Login());
  }

  bool isAuthenticated() {
    if (!_authenticated) {
      return FirebaseAuth.instance.currentUser != null;
    }
    return _authenticated;
  }

  void signUp() async {
    try {
      isLoading.toggle();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: data['email'], password: data['password']);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("weak_password".tr, "weak_password".tr,
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("email_exists".tr, "email_exists_desc".tr,
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading.toggle();
    }
  }
}

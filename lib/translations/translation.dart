
import 'package:get/get.dart';

class MainTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'invalid_user': 'Invalid User',
      'user_not_found': 'User is not found in the database. You can click Signup',
      'wrong_password_desc': 'Wrong password provided for that user.',
      'wrong_password': 'Wrong password',
      'weak_password_desc': 'Password is too weak to proceed',
      'weak_password': 'Weak password',
      'email_exists': 'Email Exists',
      'email_exists_desc': 'Email already in use',
      'email': 'Email',
      'password': 'Password',
      'dice_view': 'Dice View',
      'score_board': 'Score Board',
      'value_empty': 'Value cannot be empty',
      'invalid_email': 'Invalid Email',
      'logout_prompt': 'Do you want to logout?',
      'start': 'Tap here to start',
      'info': 'Tap the dice image to play',
      'warning': 'Warning',
      'yes': 'Yes',
      'no': 'No',
      'login': 'Login',
      'signUp': 'signUp',
      'app_name': 'DiceMaster',
    },
  };

}

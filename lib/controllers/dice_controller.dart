import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dice_master/gen/assets.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceController extends GetxController {
  var score = 0;
  var count = 0;
  var lastDiceValue = 0;
  var isLoading = false.obs;

  void tossDice() {
    if (count >= 10) {
      if (Get.isSnackbarOpen == null || !Get.isSnackbarOpen!) {
        Get.snackbar('warning'.tr, "block".tr,
            snackPosition: SnackPosition.BOTTOM);
      }
      return;
    }
    int currentValue = Random().nextInt(6) + 1;
    count++;
    lastDiceValue = currentValue;
    score += currentValue;
    saveData();
  }

  void getData() {
    isLoading.value = true;
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        json.encode(data);
        count = data['count'];
        score = data['score'];
        lastDiceValue = data['lastDiceValue'];
      }
    }).then((value) {
      isLoading.value = false;
    }).onError((error, stackTrace) {
      isLoading.value = false;
    });
  }

  void saveData() {
    isLoading.toggle();
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
      'score': score,
      'email': user.email,
      'count': count,
      'lastDiceValue': lastDiceValue,
    }).then((value) {
      isLoading.value = false;
    }).onError((error, stackTrace) {
      isLoading.value = false;
    });
  }

  Widget getImage() {
    switch (lastDiceValue) {
      case 1:
        return Assets.images.dice.dice1.image();
      case 2:
        return Assets.images.dice.dice2.image();
      case 3:
        return Assets.images.dice.dice3.image();
      case 4:
        return Assets.images.dice.dice4.image();
      case 5:
        return Assets.images.dice.dice5.image();
      case 6:
        return Assets.images.dice.dice6.image();
    }
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'start'.tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

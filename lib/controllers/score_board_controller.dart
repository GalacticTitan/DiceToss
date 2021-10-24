import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dice_master/models/user_data.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController {
  Stream<QuerySnapshot<UserData>> getData() {
    return FirebaseFirestore.instance
        .collection('Users')
        .orderBy('score')
        .limit(10)
        .withConverter<UserData>(
          fromFirestore: (snapshot, options) =>
              UserData.fromJson(snapshot.data()!),
          toFirestore: (userData, options) => userData.toJson(),
        )
        .snapshots();
  }
}

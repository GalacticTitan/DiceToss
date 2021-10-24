import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dice_master/controllers/auth_controller.dart';
import 'package:dice_master/controllers/score_board_controller.dart';
import 'package:dice_master/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ScoreController());
    AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('score_board'.tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'warning'.tr,
                    middleText: 'logout_prompt'.tr,
                    textConfirm: 'yes'.tr,
                    textCancel: 'no'.tr,
                    onConfirm: () => authController.signOut(),
                    confirmTextColor: Colors.white);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot<UserData>>(
          stream: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final dataList = snapshot.data!.docs.toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                UserData data = dataList[index].data();
                return ListTile(
                  title: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(data.email!),
                    ],
                  ),
                  subtitle: Text('Score: ${data.score!}'),
                  leading: const Icon(Icons.star),
                );
              },
              itemCount: dataList.length,
            );
          }),
    );
  }
}

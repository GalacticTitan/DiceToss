import 'package:dice_master/controllers/dice_controller.dart';
import 'package:dice_master/controllers/auth_controller.dart';
import 'package:dice_master/views/scoreboard/score_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceView extends StatelessWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiceController());
    AuthController authController = Get.find();
    controller.getData();
    authController.getVersion();
    return Scaffold(
      appBar: AppBar(
        title: Text('dice_view'.tr),
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
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ],
          );
        }
        // return Text('Score ${controller.score}');
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Count :  ${controller.count}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(const ScoreBoard());
                          },
                          child: const Text("Score Board"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: controller.getImage(),
                  ),
                  onTap: () {
                    controller.tossDice();
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Score :  ${controller.score}',
                  style:
                      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'info'.tr,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('Version: ${authController.version}')],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

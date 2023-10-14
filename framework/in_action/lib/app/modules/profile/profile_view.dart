import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_action/app/dao/quiz/quiz.dart';
import 'package:in_action/services/auth/auth_service.dart';

import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);

  final primary = const Color(0xff696b9e);
  final secondary = const Color(0xfff29a94);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
                child: Material(
                  elevation: 5.0,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    controller: controller.serachTextController,
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        prefixIcon: Material(
                          elevation: 0.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(Icons.search),
                        ),
                        suffix: TextButton(
                            onPressed: () {
                              controller.search();
                            },
                            child: Text("搜索")),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: controller.quizList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    Quiz quiz = controller.quizList.value[index];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  quiz.question ?? '',
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                ...buildOption(quiz.options),
                const SizedBox(height: 6),
                Text(
                  '答案: ${quiz.answer}',
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          if (quiz.verified != '1')
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text('${quiz.rightCount}人标记为正确, ${quiz.wrongCount}人标记为错误',
                      style: TextStyle(color: Colors.redAccent)),
                  // Text('你已标记为正确', style: TextStyle(color: Colors.amber)),
                ],
              ),
            ),
          if (quiz.verified == '1')
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text('该题已经验证无误', style: TextStyle(color: Colors.green)),
            ),
          if (quiz.verified != '1' || AuthService.to.state.userId.value == 1)
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 5),
              child: ElevatedButton(
                  onPressed: () => controller.updateCount(quiz.id!, 1),
                  child: Text('标记为正确')),
            ),
          if (quiz.verified != '1' || AuthService.to.state.userId.value == 1)
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 5),
              child: ElevatedButton(
                  onPressed: () => controller.updateCount(quiz.id!, 2),
                  child: Text('标记为错误')),
            )
        ],
      ),
    );
  }

  buildOption(List<Options>? options) {
    return options?.mapIndexed((index, element) {
      return Row(
        children: <Widget>[
          // Icon(Icons.location_on, color: secondary, size: 20),
          const SizedBox(width: 5),
          Text('${options[index].option ?? ''}: ${options[index].value ?? ''}',
              style:
                  TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
        ],
      );
    }).toList();
  }
}

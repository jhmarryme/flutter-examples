import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_action/app/dao/quiz/quiz.dart';
import 'package:in_action/app/dao/quiz/quizDao.dart';

class ProfileController extends GetxController {
  final now = DateTime.now().obs;
  final serachTextController = TextEditingController();

  // final currentChoice = 0.obs;
  final currentChoice = 0.obs;
  final quizList = <Quiz>[].obs;
  @override
  void onReady() {
    super.onReady();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        now.value = DateTime.now();
      },
    );
  }

  search() async {
    quizList.assignAll([]);

    final result = await QuizDao.list(serachTextController.text);
    print(result);
    quizList.assignAll(result);
  }

  updateCount(num quizId, int remark) async {
    final result = await QuizDao.updateCount(quizId, remark);
    search();
  }
}

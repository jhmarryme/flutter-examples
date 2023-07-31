import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_store/models/reviews.dart';
import 'package:getx_store/services/review_repository.dart';

class StoreController extends GetxController {
  ReviewRepository repository;
  final storeName = 'Thick Shake'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final reviews = <StoreReviews>[].obs;
  final storeNameEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerController = TextEditingController();
  final reviewNameController = TextEditingController();
  int storeFollowerCount = 0;

  // You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either
  /// syntax. Only one does not need the type,
  /// and the other the IDE will autocomplete it.
  static StoreController get to => Get.find();

  StoreController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    reviews.assignAll(repository.readReviews());
    ever(reviews, (callback) => repository.writeReviews(reviews));
  }

  void incrementStoreFollowers() {
    storeFollowerCount++;
    update();
  }

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }

  updateFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addNewFollower(String name) {
    followerList.add(name);
  }

  void addReview(StoreReviews storeReviews) {
    reviews.add(storeReviews);
  }

  @override
  void dispose() {
    storeNameEditingController.dispose();
    reviewEditingController.dispose();
    super.dispose();
  }
}

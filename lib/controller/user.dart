import 'package:flutter/material.dart';
import 'package:flutter_template/models/github_user.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late UserRepository _userRepository;
  final user = GithubUser().obs;
  final isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    try {
      final userInfo = await _userRepository.getGithubUserInfo();
      user.value = userInfo;
    } catch (e) {
      // 处理错误，例如显示错误消息
      debugPrint('Error getting user info: $e');
    }
  }

  void login() async {
    await _userRepository.login();
    getUserInfo();
  }
}

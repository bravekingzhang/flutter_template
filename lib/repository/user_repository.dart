import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/github_user.dart';
import 'package:flutter_template/service/http_service.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  late HttpService _httpService;

  UserRepository init() {
    _httpService = Get.find<HttpService>();
    return this;
  }

  Future<GithubUser> getGithubUserInfo(String username) async {
    try {
      final response =
          await _httpService.get<Map<String, dynamic>>('/users/$username');
      return GithubUser.fromJson(response.data!);
    } on DioException catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      rethrow;
    }
  }
}

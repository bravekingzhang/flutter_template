import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/github_user.dart';
import 'package:flutter_template/service/http_service.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository extends GetxService {
  late HttpService _httpService;

  static const clientId = "Iv1.7f5b0df57491a993";
  static const scheme = "valid-callback-scheme";
  static const authUrl = 'https://github.com/login/oauth/access_token';

  UserRepository init() {
    _httpService = Get.find<HttpService>();
    return this;
  }

  Future<GithubUser> getGithubUserInfo() async {
    var githubToken = getGithubToken();
    try {
      final response = await _httpService.get<Map<String, dynamic>>('/user',
          options: Options(headers: {
            'Accept': 'application/vnd.github+json',
            'Authorization': 'Bearer $githubToken',
            'X-GitHub-Api-Version': "2022-11-28"
          }));
      return GithubUser.fromJson(response.data!);
    } on DioException catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      rethrow;
    }
  }

  getGithubToken() {
    GetStorage box = GetStorage();
    var githubToken = box.read("github_token") ?? '';
    return githubToken;
  }

  setGithubToken(String token) {
    GetStorage box = GetStorage();
    box.write("github_token", token);
  }

  login() async {
    final result = await FlutterWebAuth2.authenticate(
      url:
          'https://github.com/login/oauth/authorize?client_id=$clientId&scope=read:user',
      callbackUrlScheme: scheme,
    );
    var authorizationCode = getCodeFromUrl(result, 'code');
    var token = await getAccessToken(authorizationCode);
    setGithubToken(token);
  }

  String getCodeFromUrl(String url, String paramName) {
    Uri uri = Uri.parse(url);
    Map<String, dynamic> queryParameters = uri.queryParameters;
    return queryParameters[paramName];
  }

  /// 注意，这部分代码一定要在服务端执行，不要在客户端执行，否则会暴露你的客户端密钥
  Future<String> getAccessToken(String authorizationCode) async {
    const String clientSecret =
        '4d6652d*******************409ed61c'; // 替换为你的 GitHub OAuth App 客户端密钥

    try {
      final response = await Dio().post(
        authUrl,
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': authorizationCode,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // 解析返回的 JSON 数据，提取 access_token
      final Map<String, dynamic> data = response.data;
      if (data.containsKey('access_token')) {
        return data['access_token'];
      } else {
        throw Exception('Access token not found in response.');
      }
    } catch (e) {
      throw Exception('Failed to get access token: $e');
    }
  }
}

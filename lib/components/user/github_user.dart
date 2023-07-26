import 'package:flutter/material.dart';
import 'package:flutter_template/controller/user.dart';
import 'package:get/get.dart';

class GithubUserInfoWidget extends StatelessWidget {
  const GithubUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      builder: (controller) {
        final user = controller.user.value;
        return Column(
          children: [
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Company: ${user.company}'),
          ],
        );
      },
    );
  }
}

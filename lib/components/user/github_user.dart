import 'package:auth_buttons/auth_buttons.dart';
import 'package:extended_image/extended_image.dart';
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
        return user.name == null
            ? GithubAuthButton(
                onPressed: () {
                  controller.login();
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExtendedImage.network(
                    user.avatarUrl!,
                    width: Get.width * 0.15,
                    height: Get.width * 0.15,
                    fit: BoxFit.fill,
                    cache: true,
                    shape: BoxShape.circle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${user.name}'),
                      Text('Email: ${user.email}'),
                      Text('Company: ${user.company}'),
                    ],
                  ),
                ],
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_template/controller/settings.dart';
import 'package:get/get.dart';

class SettingPage extends GetResponsiveView<SettingsController> {
  SettingPage({super.key});
  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: GetX<SettingsController>(builder: (controller) {
        return ListView(
          children: [
            const Divider(),
            ListTile(
              dense: true,
              title: Text('theme'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            RadioListTile(
              title: const Text('跟随系统'),
              value: ThemeMode.system,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.setThemeMode(ThemeMode.system);
              },
            ),
            RadioListTile(
              title: const Text('暗黑模式'),
              value: ThemeMode.dark,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.setThemeMode(ThemeMode.dark);
              },
            ),
            RadioListTile(
              title: const Text('白色模式'),
              value: ThemeMode.light,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.setThemeMode(ThemeMode.light);
              },
            ),
            const Divider(),
            ListTile(
              dense: true,
              title: Text('language'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            RadioListTile(
              title: const Text('中文'),
              value: 'zh',
              groupValue: controller.locale.value.languageCode,
              onChanged: (value) {
                controller.setLocale(const Locale('zh'));
              },
            ),
            RadioListTile(
              title: const Text('英文'),
              value: 'en',
              groupValue: controller.locale.value.languageCode,
              onChanged: (value) {
                controller.setLocale(const Locale('en'));
              },
            ),
          ],
        );
      }),
    );
  }
}

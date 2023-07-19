import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "appTitle": "TodoDemo",
          "toSecondPage": "to second page",
          "secondPage": "this is the second Page",
        },
        'zh_CN': {
          "appTitle": "待办",
          "toSecondPage": "去到第二页",
          "secondPage": "这里上第二页",
        }
      };
}

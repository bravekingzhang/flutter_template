import 'package:isar/isar.dart';
part 'todo.g.dart';

@collection
class Todo {
  Id? id;
  String title;
  String type; // 任务类型
  DateTime createdAt; // 创建时间
  DateTime? completedAt; // 完成时间
  bool completed;

  Todo({
    this.id,
    required this.title,
    this.type = 'default',
    required this.createdAt,
    this.completedAt,
    this.completed = false,
  });
}

//flutter pub run build_runner build

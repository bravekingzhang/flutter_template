import 'package:flutter_template/models/todo.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ToDoRepository extends GetxService {
  late Isar _isar;

  Future<ToDoRepository> init() async {
    _isar = await open();
    return this;
  }

  // 获取 Isar 实例
  Future<Isar> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [TodoSchema],
      directory: dir.path,
    );
    return isar;
  }

  // 增加一个待办事项
  Future<void> addToDo(Todo todo) async {
    await _isar.writeTxn(() async {
      await _isar.todos.put(todo);
    });
  }

// 获取待办事项（支持筛选）
  Future<List<Todo>> getToDos({bool? completed}) async {
    List<Todo>? todos;
    if (completed != null) {
      todos = await _isar.todos
          .where()
          .filter()
          .completedEqualTo(completed)
          .findAll();
    } else {
      todos = await _isar.todos.where().findAll();
    }
    return todos.toList();
  }

  // 更新一个待办事项
  Future<void> updateToDo(Todo todo) async {
    await _isar.writeTxn(() async {
      await _isar.todos.put(todo);
    });
  }

  // 删除一个待办事项
  Future<void> deleteToDo(int id) async {
    await _isar.writeTxn(() async {
      await _isar.todos.delete(id);
    });
  }
}

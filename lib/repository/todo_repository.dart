import 'package:flutter_template/models/todo.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ToDoRepository {
  // 单例模式
  static final ToDoRepository _instance = ToDoRepository._internal();

  factory ToDoRepository() {
    return _instance;
  }

  Isar? _isar;
  late Future<void> _init; // 初始化的结果

  ToDoRepository._internal() {
    _init = _initialize();
  }

  Future<void> _initialize() async {
    _isar = await open();
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
    await _init;
    await _isar?.writeTxn(() async {
      await _isar?.todos.put(todo);
    });
  }

// 获取待办事项（支持筛选）
  Future<List<Todo>> getToDos({bool? completed}) async {
    await _init;
    List<Todo>? todos;
    if (completed != null) {
      todos = await _isar?.todos
          .where()
          .filter()
          .completedEqualTo(completed)
          .findAll();
    } else {
      todos = await _isar?.todos.where().findAll();
    }
    return todos?.toList() ?? <Todo>[];
  }

  // 更新一个待办事项
  Future<void> updateToDo(Todo todo) async {
    await _init;
    await _isar?.writeTxn(() async {
      await _isar?.todos.put(todo);
    });
  }

  // 删除一个待办事项
  Future<void> deleteToDo(int id) async {
    await _init;
    await _isar?.writeTxn(() async {
      await _isar?.todos.delete(id);
    });
  }
}

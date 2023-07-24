import 'package:flutter_template/models/todo.dart';
import 'package:flutter_template/repository/todo_repository.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final ToDoRepository _toDoRepository = Get.find();

  final todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchToDos();
  }

  void addToDo(Todo todo) async {
    await _toDoRepository.addToDo(todo);
    fetchToDos();
  }

  void fetchToDos({bool? completed}) async {
    todos.value = await _toDoRepository.getToDos(completed: completed);
  }

  void updateToDo(Todo todo) async {
    await _toDoRepository.updateToDo(todo);
    fetchToDos();
  }

  void deleteToDo(int id) async {
    await _toDoRepository.deleteToDo(id);
    fetchToDos();
  }
}

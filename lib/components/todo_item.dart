import 'package:flutter/material.dart';
import 'package:flutter_template/controller/todo.dart';
import 'package:flutter_template/models/todo.dart';
import 'package:get/get.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  Color _getChipColor(String type) {
    switch (type) {
      case 'work':
        return Colors.red;
      case 'personal':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();
    final ThemeData themeData = Theme.of(context);

    return Dismissible(
      key: Key(todo.id.toString()),
      onDismissed: (direction) {
        controller.deleteToDo(todo.id!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Task deleted'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                controller.addToDo(todo);
              },
            ),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        elevation: 16,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: _getChipColor(todo.type)),
            child: Text(
              todo.type,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: todo.completed
                  ? themeData.textTheme.bodyText2?.color?.withOpacity(0.5)
                  : themeData.textTheme.bodyText2?.color,
            ),
          ),
          onTap: () {
            // 更新待办事项状态
            controller.updateToDo(
              Todo(
                id: todo.id,
                title: todo.title,
                type: todo.type,
                completed: !todo.completed,
                createdAt: todo.createdAt,
                completedAt: !todo.completed ? DateTime.now() : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

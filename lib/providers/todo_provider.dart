import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider with ChangeNotifier {
  final Box _box = Hive.box('todos');
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  List<Todo> get completedTodos => _todos.where((todo) => todo.isCompleted).toList();
  List<Todo> get pendingTodos => _todos.where((todo) => !todo.isCompleted).toList();

  void addTodo(Todo todo) {
    _box.put(todo.id, todo);
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    _box.put(todo.id, todo);
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _box.delete(id);
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      _todos[index].completedAt = _todos[index].isCompleted ? DateTime.now() : null;
      _box.put(id, _todos[index]);
      notifyListeners();
    }
  }
}
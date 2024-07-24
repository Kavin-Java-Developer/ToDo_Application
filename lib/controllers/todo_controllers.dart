import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';

class TodoControllers extends GetxController {
  var todos = <Todo>[].obs;

  TextEditingController textEditingController = TextEditingController();
//add
  void addTodo(String title) {
    if (title.isNotEmpty) {
      todos.add(Todo(title: title));
    }
  }

  //delete
  void removeAt(int index) {
    todos.removeAt(index);
  }

  //update

  void toggleTodoStatus(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }
}

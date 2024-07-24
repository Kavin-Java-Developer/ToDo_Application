import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controllers.dart';

class TodoPage extends StatelessWidget {
  final TodoControllers todoControllers = Get.put(TodoControllers());
  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            todoControllers.addTodo(todoControllers.textEditingController.text);
            todoControllers.textEditingController.clear();
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            //todo list details
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: todoControllers.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todoControllers.todos[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ListTile(
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                  decoration: todo.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (value) {
                                todoControllers.toggleTodoStatus(index);
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                todoControllers.removeAt(index);
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blue),
                        ),
                      );
                    }))),

            //todo add option

            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: todoControllers.textEditingController,
                  decoration: InputDecoration(labelText: 'Add your task here'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

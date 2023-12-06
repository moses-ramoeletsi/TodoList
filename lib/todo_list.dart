import 'package:flutter/material.dart';
import 'todo_dialog.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> todos = [];
  late String newTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItemWidget(
            todoItem: todos[index],
            onCheckboxChanged: (value) {
              setState(() {
                todos[index].isCompleted = value ?? false; // Use null-aware operator
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TodoDialog(
        onTodoAdded: (todoText) {
          // Create a new TodoItem instance and add it to the list
          setState(() {
            todos.add(TodoItem(text: todoText, isCompleted: false));
          });
          Navigator.pop(context);
        },
        onTextChanged: (text) {
          newTodo = text;
        },
      );
    },
  );
}
}

class TodoItem {
  final String text;
  bool isCompleted;

  TodoItem({required this.text, required this.isCompleted});
}

class TodoItemWidget extends StatelessWidget {
  final TodoItem todoItem;
  final ValueChanged<bool?> onCheckboxChanged; // Updated to accept nullable boolean

  TodoItemWidget({required this.todoItem, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoItem.text),
      leading: Checkbox(
        value: todoItem.isCompleted,
        onChanged: onCheckboxChanged,
      ),
    );
  }
}

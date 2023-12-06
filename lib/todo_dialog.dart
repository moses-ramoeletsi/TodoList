import 'package:flutter/material.dart';

class TodoDialog extends StatelessWidget {
  final Function(String) onTodoAdded;
  final Function(String) onTextChanged;

  TodoDialog({required this.onTodoAdded, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    String newTodo = '';
    return AlertDialog(
      title: Text('Add Todo'),
      content: TextField(
        onChanged: (value) {
          onTextChanged(value);
          newTodo = value;
        },
        decoration: const InputDecoration(
          hintText: 'Enter Your Todo',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onTodoAdded(newTodo);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

import 'package:blink_list/model/todo.dart';
import 'package:blink_list/task/update_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import statement

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final Function(String, String) onUpdateItem; // Ajoutez cette ligne

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onUpdateItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.deepPurple),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                onDeleteItem(todo.id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              onPressed: () async {
                String? newText = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateView(id: todo.id!),
                  ),
                );
                if (newText != null) {
                  onUpdateItem(todo.id!, newText); // Utilisez la fonction ici
                  // Assurez-vous de mettre à jour l'état de la liste ToDo ici
                }
              },
            ),
          ],
        ),
        // Add the subtitle here
        subtitle: Text(
          'Date of doing:  ${DateFormat('yyyy-MM-dd').format(todo.dateAdded)}',
        ),
      ),
    );
  }
}

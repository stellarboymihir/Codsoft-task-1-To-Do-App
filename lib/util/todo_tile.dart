// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  ToDoTile({
    super.key,
    required this.taskName,
    this.taskCompleted = false,
    this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration:  BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
            ),
            // Task Name
            Text(taskName,
            style:  TextStyle(
              decoration: taskCompleted 
              ? TextDecoration.lineThrough
              : TextDecoration.none,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
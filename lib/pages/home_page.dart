import 'package:flutter/material.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _controller = TextEditingController();
  // List of tasks
  List toDoList = [
    ['Make an app', false],
    ['Build it', false],
  ];

  // Checkbox was Tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Save New Task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

void createNewTask(){
  showDialog(context: context,
  builder: (context){
    return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),

    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index){
          return ToDoTile(taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          );
        }
        ),
    );
  }
}
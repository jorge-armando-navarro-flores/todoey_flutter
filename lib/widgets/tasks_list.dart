import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return TaskTile(
        taskTitle: tasks[index].name,
        isChecked: tasks[index].isDone,
        checkBoxCallback:(bool? checkboxState){
          setState(() {
            tasks[index].toggleDone();
          });

        },
      );
    }, itemCount: tasks.length,
    );
  }
}

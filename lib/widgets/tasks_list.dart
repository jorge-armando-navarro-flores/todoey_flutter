import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';



class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index){
            final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallback:(bool? checkboxState){
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Task "${task.name!}" deleted'),
              ));
            },
          );
        }, itemCount: taskData.taskCount,
        );
      },
    );
  }
}

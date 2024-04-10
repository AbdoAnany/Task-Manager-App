import 'package:flutter/material.dart';
import 'package:task_manager/core/theming/colors.dart';
import 'package:task_manager/project/todos/bloc/todos_bloc.dart';

class TaskManagementPopupMenu extends StatelessWidget {
  final Function(ChangeTodosType) onSelected;
  final bool completed;
  const TaskManagementPopupMenu({Key? key, required this.onSelected,  this. completed=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ChangeTodosType>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ChangeTodosType>>[
        // const PopupMenuItem<ChangeTodosType>(
        //   value: ChangeTodosType.add,
        //   child: Text('Add Task'),
        // ),
         PopupMenuItem<ChangeTodosType>(
          value:ChangeTodosType.update,
          child: Text(completed?"Active":'Done',style: TextStyle(color:completed?ColorsManager.wait: ColorsManager.done),),
        ),
        const PopupMenuItem<ChangeTodosType>(
          value: ChangeTodosType.delete,
          child: Text('Delete Todos',style: TextStyle(color: ColorsManager.error),),
        ),
      ],
    );
  }
}

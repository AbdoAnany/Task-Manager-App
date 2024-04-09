import 'package:flutter/material.dart';
import 'package:task_manager/project/todos/bloc/todos_bloc.dart';

class TaskManagementPopupMenu extends StatelessWidget {
  final Function(ChangeTodosType) onSelected;

  const TaskManagementPopupMenu({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ChangeTodosType>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ChangeTodosType>>[
        const PopupMenuItem<ChangeTodosType>(
          value: ChangeTodosType.add,
          child: Text('Add Task'),
        ),
        const PopupMenuItem<ChangeTodosType>(
          value:ChangeTodosType.update,
          child: Text('Update Task'),
        ),
        const PopupMenuItem<ChangeTodosType>(
          value: ChangeTodosType.delete,
          child: Text('Delete Task'),
        ),
      ],
    );
  }
}

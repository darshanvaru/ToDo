import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onCompleteChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Widget? dragIcon;

  const TaskTile({
    super.key,
    required this.task,
    required this.onCompleteChanged,
    required this.onEdit,
    required this.onDelete,
    this.dragIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        // By setting closeOnScroll to true, the Slidable will automatically close if scrolled
        closeOnScroll: true,

        // Add CloseableSlidable here to automatically hide buttons when tapping elsewhere
        key: ValueKey(task),

        // Edit Icon of slidable widget
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              // Call the onEdit callback when pressed
              onPressed: (context) => onEdit(),
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),

        // delete icon of slidable widget
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              // Call the onDelete callback when pressed
              onPressed: (context) => onDelete(),
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // CheckBox
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: task.completed,
                    onChanged: (bool? value) {
                      onCompleteChanged();
                    },
                    activeColor: Colors.green,
                  ),
                ),

                // Title and description
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: task.completed
                                ? TextDecoration.lineThrough
                                : null,
                            decorationThickness: 3,
                          ),
                        ),

                        // Description
                        Text(
                          task.description ?? 'No description',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),

                // Drag icon
                if (dragIcon != null) ...[
                  dragIcon!,
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

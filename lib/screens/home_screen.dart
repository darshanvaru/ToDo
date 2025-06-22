import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';
import '../widgets/task_dialog.dart';
import '../widgets/task_tile.dart';
import 'guide.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  TodoHomePageState createState() => TodoHomePageState();
}

class TodoHomePageState extends State<TodoHomePage> {
  List<Task> _tasks = [];
  late TaskService _taskService;

  @override
  void initState() {
    super.initState();
    _taskService = TaskService();
    _taskService.init().then((_) => _loadTasks());
  }

  // load task list from task service
  Future<void> _loadTasks() async {
    List<Task> tasks = await _taskService.loadTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  // Adding task
  void _addTask(String title, String description) {
    setState(() {
      _tasks.add(Task(title: title, description: description));
      _taskService.updateTask(_tasks);
    });
  }

  //editing an existing task
  void _editTask(int index, String title, String description) {
    setState(() {
      _tasks[index].title = title;
      _tasks[index].description = description;
      _taskService.updateTask(_tasks);
    });
  }

  //toggling checkbox of a task
  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].completed = !_tasks[index].completed;
      final task = _tasks.removeAt(index);

      // If task is completed, add it at the end; otherwise, add it at the top
      if (task.completed) {
        _tasks.add(task);
      } else {
        _tasks.insert(0, task);
      }

      _taskService.updateTask(_tasks);
    });
  }

  //deleting a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _taskService.updateTask(_tasks);
    });
  }

  //dragging a task
  void _moveTask(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final Task task = _tasks.removeAt(oldIndex);
      _tasks.insert(newIndex, task);
      _taskService.updateTask(_tasks);
    });
  }

  // adding and editing dialog box
  Future<void> _showTaskDialog({int? index}) async {
    await showTaskDialog(
      context: context,
      onSave: (title, description) {
        if (index == null) {
          _addTask(title, description);
        } else {
          _editTask(index, title, description);
        }
      },
      title: index != null ? _tasks[index].title : null,
      description: index != null ? _tasks[index].description : null,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('ToDo List', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 5,
        shadowColor: Colors.grey,
        actions: [

          //Guide button
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Guide()),
              );
            },
            tooltip: 'User Guide',
          ),
        ],
      ),

      //body
      body:
      _tasks.isEmpty
      // Empty task array
        ? Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Image of empty list
                Image.asset(
                  'assets/9264822.jpg',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),

                //text for empty list
                const Text(
                  "No tasks available to show. Add new tasks!",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
        )

            //Reorderable list view
        : ReorderableListView.builder(
          itemCount: _tasks.length,
          onReorder: _moveTask,
          itemBuilder: (context, index) {
            return TaskTile(
              key: ValueKey(_tasks[index].title),
              task: _tasks[index],
              onCompleteChanged: () => _toggleTaskCompletion(index),
              onEdit: () => _showTaskDialog(index: index),
              onDelete: () => _deleteTask(index),
              dragIcon: const Icon(Icons.drag_indicator, color: Colors.grey),
            );
          },
        ),

      //Background color of body
      backgroundColor: const Color(0xFFFFFFFF),

      //fab
      floatingActionButton: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: Colors.grey,  // White border color
            width: 3.0,  // Border width
          ),
        ),
        child: FloatingActionButton(
          onPressed: () => _showTaskDialog(),
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}

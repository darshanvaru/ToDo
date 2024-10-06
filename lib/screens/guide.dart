import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    const detailTextStyle = TextStyle(color: Colors.white70, fontSize: 16);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('User Guide'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGuideSection(
              title: "1. Add Task",
              description: "Tap the + button to add a new task. Enter the task title and description.",
              imagePath: 'assets/add_task.png',
              textStyle: textStyle,
              detailTextStyle: detailTextStyle,
            ),
            buildGuideSection(
              title: "2. Edit Task",
              description: "Swipe left on the task and tap the edit icon to modify the task details.",
              imagePath: 'assets/edit_task.png',
              textStyle: textStyle,
              detailTextStyle: detailTextStyle,
            ),
            buildGuideSection(
              title: "3. Delete Task",
              description: "Swipe left on the task and tap the delete icon to remove the task.",
              imagePath: 'assets/delete_task.png',
              textStyle: textStyle,
              detailTextStyle: detailTextStyle,
            ),
            buildGuideSection(
              title: "4. Drag Task",
              description: "Hold the drag icon on the right side of the task to reorder your tasks.",
              imagePath: 'assets/drag_task.png',
              textStyle: textStyle,
              detailTextStyle: detailTextStyle,
            ),
            buildGuideSection(
              title: "5. Tick Task",
              description: "Check the box next to the task title to mark it as completed.",
              imagePath: 'assets/tick_task.png',
              textStyle: textStyle,
              detailTextStyle: detailTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each guide section with title, description, and image
  Widget buildGuideSection({
    required String title,
    required String description,
    required String imagePath,
    required TextStyle textStyle,
    required TextStyle detailTextStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textStyle),
          const SizedBox(height: 8),
          Text(description, style: detailTextStyle),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200, // Adjust height as necessary
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

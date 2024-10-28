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
        title: const Text('User Guide', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // Sets the back button to white
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

  Widget buildGuideSection({
    required String title,
    required String description,
    required String imagePath,
    required TextStyle textStyle,
    required TextStyle detailTextStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyle),
        const SizedBox(height: 8),
        Text(description, style: detailTextStyle),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2), // Adds white border
            borderRadius: BorderRadius.circular(10),  // Optional: rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),  // Ensures image follows container shape
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(color: Colors.white54, thickness: 1.5),  // Adds a divider line between sections
        const SizedBox(height: 16),
      ],
    );
  }
}

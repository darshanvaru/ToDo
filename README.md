ToDo App
Overview
The ToDo App is a simple task management application built with Flutter. It allows users to create, edit, delete, and mark tasks as completed. The app stores tasks locally and offers a clean, user-friendly interface to manage daily activities.

Features
Add New Tasks: Users can create new tasks with a title and description.
Edit Tasks: Tasks can be edited at any time.
Mark Tasks as Completed: Users can toggle the completion status of tasks.
Delete Tasks: Tasks can be deleted individually.
Responsive UI: Supports multiple screen sizes and orientations.
Swipe Actions: Swipe left to edit or right to delete a task.
Dark UI Theme: Consistent dark theme throughout the app.

How It Works
Task Management
The core functionality of the app revolves around the Task model:

Add Task: The FloatingActionButton opens a dialog to add a new task. Tasks are stored in a list and displayed in the home screen.
Edit Task: A task can be edited by swiping left and selecting the edit icon.
Delete Task: Swipe right to delete a task. The list is updated accordingly.
Mark as Complete: Tasks can be marked as complete using the checkbox in the task tile.
UI Customization
FloatingActionButton (FAB): The FAB has a custom white border and uses deep purple as the background color.
Task Tile: Each task is wrapped in a Slidable widget that allows swiping to edit or delete.
Task Service
The TaskService class is responsible for managing task data, including loading and updating tasks. Future plans could involve integrating a backend or database to persist the data across sessions.

Contributing
Contributions are welcome! If you'd like to contribute to the project:

Fork the repository.
Create a new branch for your feature: git checkout -b feature-name.
Commit your changes: git commit -m 'Add feature'.
Push the branch: git push origin feature-name.
Open a pull request.
Future Enhancements
Some potential future enhancements include:

Integration with a backend (e.g., Firebase) for persistent storage.
Adding notifications for task reminders.
Implementing filters for completed/incomplete tasks.
Multi-platform support (e.g., iOS, Web).

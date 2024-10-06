class Task {
  String title;
  String? description;
  bool completed;

  Task({required this.title, this.description, this.completed = false});

  // Converting Task to a Map (for storing in SharedPreferences)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  // Creating a Task from a Map (for retrieving from SharedPreferences)
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      completed: json['completed'],
    );
  }
}

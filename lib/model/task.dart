class Task {
  final String taskName;
  final String taskDesc;
  final String taskId;
  final dynamic createAt;

  Task(
      {required this.taskName,
      required this.taskDesc,
      required this.taskId,
      required this.createAt});

  Map<String, dynamic> toMap() {
    return {
      'task_name': taskName,
      'task_desc': taskDesc,
      'task_id': taskId,
      'created_at': createAt
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        taskName: map['task_name'],
        taskDesc: map['task_desc'],
        taskId: map['task_id'],
        createAt: map['created_at']);
  }
}

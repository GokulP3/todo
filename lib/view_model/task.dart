import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/task.dart';

class TaskViewModel with ChangeNotifier {
  final DatabaseReference _todoRef =
      FirebaseDatabase.instance.ref().child('todo');

  List<Task> _todos = [];
  bool loading = false;
  List<Task> get todos => _todos;

  void getTask() {
    try {
      _todoRef.orderByKey().onValue.listen((event) {
        loading = true;
        notifyListeners();
        var temp = event.snapshot.value;
        temp = temp ?? {};
        var data = temp as Map;
        debugPrint(data.toString());
        if (data.isEmpty) {
          _todos = [];
        } else {
          _todos = data.entries.map((entry) {
            String taskId = entry.key;
            Map taskDetails = entry.value;
            return Task(
              taskName: taskDetails['task_name'],
              taskDesc: taskDetails['task_desc'],
              createAt: taskDetails['create_at'],
              taskId: taskId,
            );
          }).toList();
        }

        loading = false;
        notifyListeners();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void addTask(Map task) {
    _todoRef.push().set(task);
  }

  void updateTask(String key, Map<String, dynamic> task) {
    _todoRef.child(key).update(task);
  }

  void deleteTodo(String key) {
    _todoRef.child(key).remove();
  }
}

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../model/task.dart';
import '../utils/routes/routes.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [_taskInfo(context), _taskDesc()],
        ),
      ),
    );
  }

  Widget _taskInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.taskName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Wrap(
          runSpacing: 10,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Routes.task, arguments: task.toMap());
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(onPressed: _shareInfo, icon: const Icon(Icons.share))
          ],
        )
      ],
    );
  }

  Widget _taskDesc() {
    return Row(
      children: [Text("Description:\t${task.taskDesc}")],
    );
  }

  void _shareInfo() {
    Share.share(task.taskDesc);
  }
}

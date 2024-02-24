import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/task.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/task_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 3,
      title: const Text("My Tasks"),
    );
  }

  Widget _body() {
    return Consumer<TaskViewModel>(builder: (context, provider, child) {
      return provider.loading
          ? _loading()
          : provider.todos.isEmpty
              ? _empty()
              : ListView.builder(
                  itemCount: provider.todos.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return TaskDetails(task: provider.todos[index]);
                  });
    });
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _empty() {
    return const Center(
      child: Text(
        "No Tasks",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 3,
      onPressed: () {
        _navToAddEditTask(context);
      },
      tooltip: "Add task",
      child: const Icon(Icons.add),
    );
  }

  void _navToAddEditTask(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.task, arguments: {});
  }
}

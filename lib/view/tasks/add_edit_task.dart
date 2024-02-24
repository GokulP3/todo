import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/task.dart';
import 'package:todo/widgets/snack_bar.dart';
import 'package:todo/widgets/text_input_field.dart';

class AddEditTask extends StatelessWidget {
  AddEditTask({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskName = TextEditingController();
  final TextEditingController _taskDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    _taskName.text = data['task_name'] ?? '';
    _taskDesc.text = data['task_desc'] ?? '';
    debugPrint(data.toString());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _appBar(),
        body: _body(context, data),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 3,
      title: const Text("Add/Edit Task"),
    );
  }

  Widget _body(BuildContext context, Map data) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              _taskNameField(),
              _taskDescField(),
              _actionButton(context, data)
            ],
          )),
    );
  }

  Widget _taskNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormFieldWidget(
              controller: _taskName,
              labelText: "Task Name",
              hintText: "Enter task name",
              autoValidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Task name is required";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _taskDescField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormFieldWidget(
              controller: _taskDesc,
              labelText: "Task Description",
              maxLines: 3,
              textInputAction: TextInputAction.done,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Enter description",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Task Description is required";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context, Map data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              _addEditTask(context, data);
            },
            child: const Text("Save"),
          ))
        ],
      ),
    );
  }

  void _addEditTask(BuildContext context, Map data) {
    try {
      if (_formKey.currentState!.validate()) {
        if (data.isEmpty) {
          context.read<TaskViewModel>().addTask({
            'task_name': _taskName.text.trim(),
            'task_desc': _taskDesc.text.trim(),
            'created_at': DateTime.now().millisecondsSinceEpoch
          });
          SnackBarWidget.message(context, "Task added");
        } else {
          context.read<TaskViewModel>().updateTask(data['task_id'], {
            'task_name': _taskName.text.trim(),
            'task_desc': _taskDesc.text.trim(),
            'created_at': DateTime.now().millisecondsSinceEpoch
          });
          SnackBarWidget.message(context, "Task edited successfully!");
        }
        Navigator.of(context).pop();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      SnackBarWidget.message(context, "oops, try again later");
      Navigator.of(context).pop();
    }
  }
}

import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/task.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => TaskViewModel()),
];

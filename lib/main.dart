import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:routine_app/collecetion/category.dart';
import 'package:routine_app/collecetion/routine.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [RoutineSchema, CategorySchema],
    directory: dir.path,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

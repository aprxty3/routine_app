import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:routine_app/collecetion/category.dart';
import 'package:routine_app/collecetion/routine.dart';
import 'package:path_provider/path_provider.dart';
import 'package:routine_app/screen/create_routine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      debugShowCheckedModeBanner: false,
      title: 'Routine App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Apps'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateRoutine(),
              ),
            ),
            icon: const Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
    );
  }
}

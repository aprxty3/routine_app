import 'package:isar/isar.dart';
//Needs : category, title, start time, day

@Collection()
class Routine {
  late String title;
  late DateTime startTime;
  late String dayTime;
  late String category;
}

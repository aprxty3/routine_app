import 'package:isar/isar.dart';
//Needs : category, title, start time, day

@Collection()
class Routine {
  @Id()
  int id = Isar.autoIncrement;

  late String title;

  @Index()
  late DateTime startTime;

  @Index(caseSensitive: false)
  late String dayTime;

  @Index(composite: [CompositeIndex('index')])
  late String category;
}

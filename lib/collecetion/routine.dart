import 'package:isar/isar.dart';
import 'category.dart';
part 'routine.g.dart';

@Collection()
class Routine {
  @Id()
  int id = Isar.autoIncrement;

  late String title;

  @Index()
  late DateTime startTime;

  @Index(caseSensitive: false)
  late String day;

  @Index(composite: [CompositeIndex('title')])
  final category = IsarLink<Category>();
}

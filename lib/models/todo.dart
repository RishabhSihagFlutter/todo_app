import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  DateTime dueDate;

  @HiveField(5)
  String category;

  @HiveField(6)
  int priority;

  @HiveField(7)
  List<String> subtasks;

  @HiveField(8)
  DateTime createdAt;

  @HiveField(9)
  DateTime? completedAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.dueDate,
    required this.category,
    this.priority = 1,
    this.subtasks = const [],
    required this.createdAt,
    this.completedAt,
  });
}
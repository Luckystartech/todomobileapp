import '../data_layer_model.dart';

class TodoModel {
  String? id;
  final String taskTitle;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final bool completed;

  TodoModel({
    this.id,
    required this.taskTitle,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskTitle': taskTitle,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      taskTitle: map['taskTitle'] ?? '',
      date: map['date'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      description: map['description'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
      id: doc.id,
      taskTitle: doc['taskTitle'],
      date: doc['date'],
      startTime: doc['startTime'],
      endTime: doc['endTime'],
      description: doc['description'],
      completed: doc['completed'],
    );
  }
}


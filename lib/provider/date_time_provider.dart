import 'package:riverpod/riverpod.dart';
import 'package:todoapp/models/todo_model.dart';

class DateTimeProvider {
  // date provider
  static final dateProvider = StateProvider<String>((ref) {
    return 'dd/mm/yy';
  });

  // start time provider
  static final startTimeProvider = StateProvider<List<String>>((ref) {
    return ['00:00', 'PM'];
  });

  static final editStartTimeProvider =
      StateProvider.family<List<String>, TodoModel>((ref, todoTask) {
    if (todoTask.startTime.isNotEmpty) {
      return todoTask.startTime.split(' ');
    } else {
      return ['00:00', 'PM'];
    }
  });
  static final editEndTimeProvider =
      StateProvider.family<List<String>, TodoModel>((ref, todoTask) {
    if (todoTask.endTime.isNotEmpty) {
      return todoTask.endTime.split(' ');
    } else {
      return ['00:00', 'PM'];
    }
  });
  
  static final editedDateProvider = StateProvider<List<String>>((ref) {
    return ['00:00', 'PM'];
  });

  // End-time provider
  static final endTimeProvider = StateProvider<List>((ref) {
    return ['00:00', 'PM'];
  });

  static final calendarEventProvider =
      StateProvider<Map<DateTime, List<TodoModel>>>((ref) {
    return {};
  });
}

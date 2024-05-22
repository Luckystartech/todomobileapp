import '../data_layer_model.dart';

class TodoService {
  static final todoCollection = FirebaseFirestore.instance
      .collection('users')
      .doc('userId')
      .collection('todos');

  // CREATE
  Future<void> addNewTask(TodoModel model) async {
    await todoCollection.add(model.toMap());
  }

  // UPDATE CHECKLIST
  void updateTask(String? docId, bool? valueUpdate) {
    todoCollection.doc(docId).update({
      'completed': valueUpdate,
    });
  }

  // EDIT TASK
  void editTask(String? docId, TodoModel model) async {
    await todoCollection.doc(docId).update(model.toMap());
  }

  // DELETE
  void deleteTask(String? docId) {
    todoCollection.doc(docId).delete();
  }

  int getTotalCompletedTask(List<TodoModel> task) {
    final total = task.where((task) => task.completed).length;
    return total;
  }

  List<String> getStartTime(TodoModel task) {
    final date = task.startTime.split(' ');
    return date;
  }
}

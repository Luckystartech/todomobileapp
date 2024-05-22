import 'package:todoapp/service/todo_service.dart';

import '../data_layer_model.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('users')
      .doc('userId')
      .collection('todos')
      .snapshots()
      .map(
    (snapshot) {
      return snapshot.docs.map((doc) => TodoModel.fromSnapshot(doc)).toList();
    },
  );

  yield* getData;
});

// get Todo with same category
final fetchTodoProvider =
    StreamProvider.family<List<TodoModel>, String>((ref, id) async* {
  final getCategory = FirebaseFirestore.instance
      .collection('users')
      .doc('userId')
      .collection('todos')
      .where('id', isEqualTo: id)
      .snapshots()
      .map(
    (snapshot) {
      return snapshot.docs.map((doc) => TodoModel.fromSnapshot(doc)).toList();
    },
  );


  yield* getCategory;
});

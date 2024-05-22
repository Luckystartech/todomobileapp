import 'package:todoapp/data_layer_model.dart';
import 'package:todoapp/views/edit_task_screen.dart';

class TodoTaskScreen extends ConsumerWidget {
  const TodoTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get all todo tasks
    final todoData = ref.watch(fetchStreamProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppStyle.primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
            child: Text(
          'All Tasks',
          style: AppStyle.heading1White,
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/profile.png',
                  width: 30,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              todoData.when(
                  data: (todoData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: todoData.length,
                        itemBuilder: (context, index) {
                          return TodoTaskCardWidget(
                            getIndex: index,
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditTodoTaskForm(
                                        todoData: todoData[index],
                                      )));
                            },
                          );
                        });
                  },
                  error: (error, stackTrace) =>
                      const Center(child: Text('error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()))
            ],
          ),
        ),
      ),
    );
  }
}



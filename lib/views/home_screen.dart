import 'package:todoapp/data_layer_model.dart';
import 'package:todoapp/views/edit_task_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);

    return Scaffold(
        // AppBar Section
        appBar: AppBar(
          elevation: 3,
        backgroundColor: AppStyle.primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white,),
          title: const Center(
              child: Text(
            'TodoApp',
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
        // Greet User Section
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(-20, 0),
                  child: const ListTile(
                    title: Text('Hello Jennifer', style: AppStyle.heading1),
                  ),
                ),
                const Gap(5),
                // Search Field
                const SearchFieldWidget(
                  hintText: 'find a task',
                  icon: Icons.search,
                ),
                const Gap(20),
                // progress display card
                todoData.when(
                    data: (todoData) {
                      int noOfCompletedTasks = ref
                          .read(serviceProvider)
                          .getTotalCompletedTask(todoData);

                      int totalTasks = todoData.length;

                      int unCompletedTask = totalTasks - noOfCompletedTasks;

                      double ratioOfCompletedtasks =
                          noOfCompletedTasks / totalTasks;
                      return ProgressDisplayWidget(
                        title: 'Progress Summary',
                        subTitle:
                            '$noOfCompletedTasks Tasks Completed - $unCompletedTask uncompleted',
                        progressIndicatorValue: ratioOfCompletedtasks,
                      );
                    },
                    error: (error, stackTrace) =>
                        const Center(child: Text('error')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator())),
                const Gap(20),
                const SectionHeadingWidget(
                  sectionTitle: 'My Tasks',
                  linkText: 'View All',
                  screen: TodoTaskScreen(),
                ),
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyle.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTodoTaskForm()),
          ),
        ));
  }
}

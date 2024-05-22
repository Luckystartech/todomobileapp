import 'package:intl/intl.dart';
import '../data_layer_model.dart';

class EditTodoTaskForm extends ConsumerWidget {
  EditTodoTaskForm({super.key, required this.todoData});

  final TodoModel todoData;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providers
    // String dateProv = ref.watch(DateTimeProvider.dateProvider);
    String dateProv = ref.watch(DateTimeProvider.dateProvider) == 'dd/mm/yy'
        ? todoData.date
        : ref.watch(DateTimeProvider.dateProvider);

    final startTimeProv =
        ref.watch(DateTimeProvider.editStartTimeProvider(todoData));
    final endTimeProv =
        ref.watch(DateTimeProvider.editEndTimeProvider(todoData));

    titleController.text = todoData.taskTitle;
    descriptionController.text = todoData.description;

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppStyle.primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
            child: Text(
          'Edit Todo Task',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title text field
              TextFieldWidget(
                textEditingController: titleController,
                title: 'Title',
              ),
              // DateField
              DateWidget(
                date: dateProv,
                onTap: () async {
                  final getDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025));
                  if (getDate != null) {
                    final format = DateFormat.yMd();
                    ref.read(DateTimeProvider.dateProvider.notifier).update(
                      (state) {
                        dateProv = format.format(getDate);
                        return dateProv;
                      },
                    );
                  }
                },
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeWidget(
                    headingTitle: 'Start time',
                    time: startTimeProv[0],
                    period: startTimeProv[1],
                    onTap: () async {
                      final getTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (getTime != null) {
                        ref
                            .read(DateTimeProvider.editStartTimeProvider(todoData).notifier)
                            .update((state) {
                          return getTime.format(context).split(' ');
                          // startTimeProv = getTime.format(context).split(' ');
                          // return startTimeProv;
                        });
                      }
                    },
                  ),
                  TimeWidget(
                    headingTitle: 'End time',
                    time: endTimeProv[0],
                    period: endTimeProv[1],
                    onTap: () async {
                      final getTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (getTime != null) {
                        ref
                            .read(DateTimeProvider.editEndTimeProvider(todoData).notifier)
                            .update(
                                (state) => getTime.format(context).split(' '));
                      }
                    },
                  ),
                ],
              ),
              const Gap(20),
              // Description field
              TextFieldWidget(
                textEditingController: descriptionController,
                title: 'Description',
                maxLines: 2,
              ),
              const Gap(20),
              ButtonWidget(
                onPressed: () {
                  TodoModel updatedTodoTask = TodoModel(
                    taskTitle: titleController.text,
                    date: dateProv,
                    startTime: '${startTimeProv[0]} ${startTimeProv[1]}',
                    endTime: '${endTimeProv[0]} ${endTimeProv[1]}',
                    description: descriptionController.text,
                    completed: todoData.completed,
                  );

                  // submit todotask to database
                  ref
                      .read(serviceProvider)
                      .editTask(todoData.id, updatedTodoTask);
                  //clear TextFields
                  titleController.clear();
                  descriptionController.clear();

                  Navigator.pop(context);
                },
                buttontext: 'Update Task',
              )
            ],
          ),
        ),
      ),
    );
  }
}

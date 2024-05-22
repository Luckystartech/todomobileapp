import 'package:intl/intl.dart';
import '../data_layer_model.dart';

class CreateTodoTaskForm extends ConsumerWidget {
  CreateTodoTaskForm({super.key});

  final categoryController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providers
    final dateProv = ref.watch(DateTimeProvider.dateProvider);
    final startTimeProv = ref.watch(DateTimeProvider.startTimeProvider);
    final endTimeProv = ref.watch(DateTimeProvider.endTimeProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppStyle.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: ()=>Navigator.pop(context),
        ),
        title: const Center(
            child: Text(
          'Add Todo Task',
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
                          (state) => format.format(getDate),
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
                            .read(DateTimeProvider.startTimeProvider.notifier)
                            .update(
                                (state) => getTime.format(context).split(' '));
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
                            .read(DateTimeProvider.endTimeProvider.notifier)
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
                  TodoModel newTodoTask = TodoModel(
                    taskTitle: titleController.text,
                    date: dateProv,
                    startTime: '${startTimeProv[0]} ${startTimeProv[1]}',
                    endTime: '${endTimeProv[0]} ${endTimeProv[1]}',
                    description: descriptionController.text,
                    completed: false,
                  );

                  // submit todotask to database
                  ref.read(serviceProvider).addNewTask(newTodoTask);
                  //clear TextFields
                  titleController.clear();
                  descriptionController.clear();

                  Navigator.pop(context);
                },
                buttontext: 'Create a New Task',
              )
            ],
          ),
        ),
      ),
    );
  }
}

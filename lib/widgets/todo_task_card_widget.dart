import '../data_layer_model.dart';

class TodoTaskCardWidget extends ConsumerWidget {
  const TodoTaskCardWidget({
    super.key,
    required this.getIndex,
    required this.onDoubleTap, 
  });

  final int getIndex;
  final VoidCallback onDoubleTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // fetch all todotasks
    final todoData = ref.watch(fetchStreamProvider);
    // final todoData = watch;

    return todoData.when(
        data: (todoData) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Material(
                elevation: 20,
                shadowColor: Colors.black38,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                child: GestureDetector(
                  onDoubleTap: onDoubleTap,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todoData[getIndex].completed,
                    onChanged: (value) {
                      ref
                          .read(serviceProvider)
                          .updateTask(todoData[getIndex].id, value);
                    },
                    activeColor: Colors.blue,
                    side: const BorderSide(
                        width: 2, color: AppStyle.primaryColor),
                    title: Text(
                      todoData[getIndex].taskTitle,
                      style: AppStyle.heading3,
                    ),
                    subtitle: Text(
                      '${todoData[getIndex].startTime} - ${todoData[getIndex].endTime}',
                      style: AppStyle.bodyTextGrey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    secondary: IconButton(
                      onPressed: () {
                        ref
                            .watch(serviceProvider)
                            .deleteTask(todoData[getIndex].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppStyle.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        error: (error, stackTrace) => const Center(child: Text('Error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

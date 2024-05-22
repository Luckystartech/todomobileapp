import 'package:todoapp/data_layer_model.dart';

class CalenderScreen extends ConsumerWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppStyle.primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
            child: Text(
          'Calendar',
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
      body: Column(
        children: [
          todoData.when(
              data: (todoData) {
                // ////////////
                DateTime today = DateTime.now();
               
                return TableCalendar(
                  focusedDay: today,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  // onDaySelected: onDaySelected,
                );
              },
              error: (error, stackTrace) => const Center(child: Text('error')),
              loading: () => const Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}

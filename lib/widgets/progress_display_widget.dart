import '../data_layer_model.dart';

class ProgressDisplayWidget extends StatelessWidget {
  const ProgressDisplayWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.progressIndicatorValue});

  final String title;
  final String subTitle;
  final double progressIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TodoTaskScreen())),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppStyle.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: AppStyle.heading1White,
              ),
              Text(
                subTitle,
                style: AppStyle.bodyTextLight,
              ),
              LinearProgressIndicator(
                value: progressIndicatorValue,
                color: Colors.blue.shade800,
              )
            ],
          ),
        ),
      ),
    );
  }
}

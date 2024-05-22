import '../data_layer_model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onPressed, required this.buttontext});

  final VoidCallback onPressed;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 110, vertical: 15.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => AppStyle.primaryColor)),
        onPressed: onPressed,
        child: Text(
          buttontext,
          style: AppStyle.heading2White,
        ),
      ),
    );
  }
}

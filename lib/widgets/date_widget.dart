import 'package:todoapp/data_layer_model.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key, required this.date, required this.onTap});

  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date', style: AppStyle.bodyTextGrey),
          const Gap(6),
          Row(
            children: [
              Ink(
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        date,
                        style: const TextStyle(
                            letterSpacing: 2, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

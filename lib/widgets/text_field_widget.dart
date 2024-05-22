import '../data_layer_model.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.icon,
    required this.title,
    this.maxLines,
    this.onPressed,
    this.textEditingController,
  });

  final String title;
  final String? hintText;
  final IconData? icon;
  final int? maxLines;
  final VoidCallback? onPressed;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.bodyTextGrey),
        const Gap(6),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: textEditingController,
            maxLines: maxLines,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                suffixIcon: IconButton(
                  icon: Icon(icon),
                  color: Colors.grey[600],
                  onPressed: onPressed,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500])),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todoapp/common/app_style.dart';

class SectionHeadingWidget extends StatelessWidget {
  const SectionHeadingWidget(
      {super.key, required this.sectionTitle, required this.linkText, required this.screen});

  final String sectionTitle;
  final String linkText;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: AppStyle.heading2,
        ),
        // Link to the new screen
        GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen )),//the screen widget
          child: Text(
            linkText,
            style: AppStyle.bodyTextGrey,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/common/app_style.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.headingTitle,
    required this.onTap,
    required this.time,
    required this.period,
  });

  final String headingTitle;
  final VoidCallback onTap;
  final String time;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headingTitle, style: AppStyle.bodyTextGrey),
        const Gap(6),
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    time,
                    style: const TextStyle(
                        letterSpacing: 2, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              period,
              style: AppStyle.heading3,
            )
          ],
        )
      ],
    );
  }
}

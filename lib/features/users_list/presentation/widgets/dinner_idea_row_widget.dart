import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class DinnerIdeaRowWidget extends StatelessWidget {
  const DinnerIdeaRowWidget({
    required this.dateIdea,
    super.key,
  });
  final String dateIdea;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.event_available,
              color: AppPallete.kPrimaryColor,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              dateIdea,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(
          Icons.more_horiz,
          size: 16,
          color: AppPallete.kBlackColor,
        )
      ],
    );
  }
}

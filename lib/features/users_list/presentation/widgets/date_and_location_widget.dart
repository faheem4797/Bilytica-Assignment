import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class DateAndLocationWidegt extends StatelessWidget {
  const DateAndLocationWidegt({
    super.key,
    required this.location,
    required this.dateTime,
  });

  final String location;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: AppPallete.kBlackColor,
                      size: 14,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Date',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  dateTime,
                  style: const TextStyle(
                      fontSize: 12, height: 1.7, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: VerticalDivider(
              color: AppPallete.kDividerColor,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppPallete.kBlackColor,
                      size: 14,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: const TextStyle(
                      fontSize: 12, height: 1.7, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

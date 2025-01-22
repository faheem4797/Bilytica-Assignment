import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/date_and_location_widget.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/dinner_idea_row_widget.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/profile_image_and_name_widget.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.index,
    required this.listLength,
  });

  final User user;
  final int index;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: AppPallete.kSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              DinnerIdeaRowWidget(
                dateIdea: user.dateIdea,
              ),
              const Divider(
                color: AppPallete.kDividerColor,
              ),
              ProfileImageAndNameWidget(user: user),
              const SizedBox(height: 8),
              DateAndLocationWidegt(
                location: user.location,
                dateTime: user.date,
              ),
              if (index == listLength - 1)
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

class ProfileImageAndNameWidget extends StatelessWidget {
  const ProfileImageAndNameWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfileImageWidget(userImage: user.profileImageLink),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name} - ${user.age}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '3 km from you',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
                ),
              ],
            )
          ],
        ),
        const Row(
          children: [
            Icon(Icons.maps_ugc, color: AppPallete.kPrimaryColor, size: 18),
            SizedBox(width: 16),
            Icon(Icons.phone, color: AppPallete.kPrimaryColor, size: 18),
          ],
        )
      ],
    );
  }
}

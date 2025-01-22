import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.userImage,
  });

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: CachedNetworkImage(
              imageUrl: userImage,
              placeholder: (context, url) => const Icon(Icons.person),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppPallete.kPrimaryColor, width: 2),
                shape: BoxShape.circle),
          ),
          const Positioned(
            bottom: 3,
            right: 3,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppPallete.kGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}

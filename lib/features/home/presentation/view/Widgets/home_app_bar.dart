//home_app_bar.dart
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.icnotifications,
            width: 40.w,
            height: 40.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SizedBox(
            width: 40.w,
            height: 40.h,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-1/482083315_1782184069016989_4642233234716381867_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=101&ccb=1-7&_nc_sid=1d2534&_nc_ohc=Ua7EU04oHMkQ7kNvwFC55f_&_nc_oc=AdkqkBsa0giCuU-0JiB1EUuCI0knnL_XrZKxNK4vyrn56Mq5iGz2JvMRR3ToTkPS7vg&_nc_zt=24&_nc_ht=scontent.fcai19-5.fna&_nc_gid=PM2wdauDuKJt6y8wImUT2Q&oh=00_AfXXBlEqk0y5vXclXgj-HlGOR1IabUe2e1aHZXyg4BMppw&oe=68B4968E'),
            ),
          ),
        )
      ],
    );
  }
}

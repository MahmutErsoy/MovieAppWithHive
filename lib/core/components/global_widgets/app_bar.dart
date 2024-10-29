import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_with_hive/core/constants/colors_constants.dart';
import 'package:movie_app_with_hive/core/constants/navigation_constants.dart';
import 'package:movie_app_with_hive/core/navigation/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBookmark;
  final bool showBackButton;
  final VoidCallback? onBookmarkPressed;
  final VoidCallback? onBackButtonPressed;
  final String? previousPage;
  final bool? isBookmarked;

  CustomAppBar({
    Key? key,
    required this.title,
    this.showBookmark = false,
    this.showBackButton = false,
    this.onBookmarkPressed,
    this.onBackButtonPressed, 
    this.previousPage, 
    this.isBookmarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.displayMedium,),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon:  Icon(Icons.arrow_back, color: ColorConstants.instance.white, size: 25.sp,),
              onPressed: onBackButtonPressed ??
                  () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    } else if (previousPage != null) {
                      NavigationService.instance.navigateToPageClear(
                        path: previousPage!,
                      );
                    } else {
                      NavigationService.instance.navigateToPageClear(
                        path: NavigationConstants.homePage,
                      );
                    }
                  },
            )
          : null,
      actions: [
        if (showBookmark)
          IconButton(
            icon:  Icon(
              isBookmarked == true ? Icons.bookmark : Icons.bookmark_border, 
              color: ColorConstants.instance.white, 
              size: 25.sp,
            ),
            onPressed: onBookmarkPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

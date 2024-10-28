import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/constants/colors_constants.dart';
import 'package:movie_app_with_hive/core/constants/string_constants.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorConstants.instance.cerulean,
      unselectedItemColor: ColorConstants.instance.midGray,
      backgroundColor: ColorConstants.instance.charade,
      currentIndex: currentIndex,
      onTap: onTap,
      iconSize: 24,
      selectedIconTheme:  IconThemeData(
        color: ColorConstants.instance.cerulean,
      ),
      unselectedFontSize: 13,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      ),
      selectedFontSize: 13,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      ),
      items:  const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: StringConstants.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: StringConstants.search,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: StringConstants.watchList,
        ),
      ],
    );
  }
}
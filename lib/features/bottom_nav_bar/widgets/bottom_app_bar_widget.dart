import 'package:flutter/material.dart';
import 'package:hogwards_app/features/bottom_nav_bar/widgets/widgets.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 69,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAppBarItem(
            defaultIcon: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
            page: 0,
            filledIcon: const Icon(Icons.home),
            pageController: pageController,
          ),
          BottomAppBarItem(
            defaultIcon: const Icon(
              Icons.list,
              color: Colors.grey,
            ),
            page: 1,
            filledIcon: const Icon(Icons.list),
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}

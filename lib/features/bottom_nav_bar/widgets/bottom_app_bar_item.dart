import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bloc/bottom_nav_cubit.dart';

class BottomAppBarItem extends StatelessWidget {
  final Icon defaultIcon;
  final Icon filledIcon;
  final int page;
  final PageController pageController;

  const BottomAppBarItem({
    super.key,
    required this.defaultIcon,
    required this.page,
    required this.filledIcon,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);

        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 13),
            BlocBuilder<BottomNavCubit, int>(
              builder: (context, state) {
                return state == page ? filledIcon : defaultIcon;
              },
            ),
          ],
        ),
      ),
    );
  }
}

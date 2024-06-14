import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bloc/bottom_nav_cubit.dart';
import 'package:hogwards_app/features/bottom_nav_bar/widgets/widgets.dart';
import 'package:hogwards_app/features/home/home.dart';
import 'package:hogwards_app/features/list/list.dart';

class BottomNavBarScreen extends StatefulWidget {
  final int indexOfTryAgain;
  const BottomNavBarScreen({super.key, required this.indexOfTryAgain});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  late PageController pageController;
  late int index;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    index = widget.indexOfTryAgain;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
     HomeScreen(indexOfTryAgain: index),
    const ListScreen(),
  ];
    return Scaffold(
      body: PageView(
        onPageChanged: (int page) => onPageChanged(page),
        controller: pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBarWidget(pageController: pageController),
    );
  }
}

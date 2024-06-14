import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bloc/bottom_nav_cubit.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:hogwards_app/themes/hogwards_app_theme.dart';

class HogwardsApp extends StatelessWidget {
  const HogwardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: hogwardsAppTheme,
      home: BlocProvider(
          create: (context) => BottomNavCubit(),
          child: const BottomNavBarScreen(indexOfTryAgain: -1,),
        ),
    );
  }
}
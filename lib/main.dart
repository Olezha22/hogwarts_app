import 'package:flutter/material.dart';
import 'package:hogwards_app/db_hive/hive_repository.dart';
import 'package:hogwards_app/hogwarts_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepository().initHive();
  runApp(const HogwardsApp());
}

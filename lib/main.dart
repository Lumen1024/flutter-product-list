import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/routes.dart';
import 'src/constants/strings.dart';
import 'src/theme/defult.dart';
import 'src/data/hive_extension.dart';

void main() async {
  await HiveExtension.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: getDefaultTheme(),
      routes: appRoutes(),
    );
  }
}

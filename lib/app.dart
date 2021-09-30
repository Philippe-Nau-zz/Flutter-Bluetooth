import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/presentation/home/view/home_view.dart';
import 'package:flutter_bluetooth/utils/theme.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Blue',
      theme: AppTheme.themeData,
      home: HomeView(),
    );
  }
}

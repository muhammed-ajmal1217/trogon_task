import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogontask/controller/api_service_provider.dart';
import 'package:trogontask/controller/bottom_bar_provider.dart';
import 'package:trogontask/view/widgets/bottom_nav_bar.dart';

void main()async{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarProvider(),),
        ChangeNotifierProvider(create: (context) => ApiServiceProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
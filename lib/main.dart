import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_database_task/pages/login_page.dart';
import 'package:local_database_task/pages/reg_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('task_base');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        RegPage.id: (context) => RegPage(),
        LoginPage.id: (context) => LoginPage()
      },
    );
  }
}

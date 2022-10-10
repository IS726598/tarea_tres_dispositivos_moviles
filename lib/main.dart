import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_tres/book_provider.dart';
import 'package:tarea_tres/home_page.dart';

void main() => runApp(
  ChangeNotifierProvider<BookProvider>(
    create: (context) => BookProvider(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.grey[800]
      ),
    );
  }
}



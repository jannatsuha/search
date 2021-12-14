import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/provider/book_provider.dart';
import 'package:search/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<BookProvider>
            (create: (_)=> BookProvider()),
        ],
      child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

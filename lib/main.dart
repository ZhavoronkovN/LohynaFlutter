import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/register.dart';
import './pages/profile.dart';
import 'pages/notes/notes.dart';
import './pages/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (BuildContext context) => LogInPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/profile': (BuildContext context) => ProfilePage(),
        '/notes': (BuildContext context) => NotesPage(),
        '/news': (BuildContext context) => NewsPage(),
      },
    );
  }
}

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:delivery_system/views/homes/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          elevation: 1,
          shadowColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      home: RoutePage(),
    );
  }
}

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  Widget navButton({required String title, dynamic nav}) {
    return SizedBox(
      width: 500,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.indigo,
        ),
        onPressed: null,
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navButton(title: 'トップ'),
            navButton(title: 'ログイン'),
            SizedBox(
              width: 500,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () async {
                  await Navigator.of(context).push<dynamic>(
                    HomePage.route(),
                  );
                },
                child: const Text('新規注文'),
              ),
            ),
            navButton(title: '注文詳細'),
          ],
        ),
      ),
    );
  }
}

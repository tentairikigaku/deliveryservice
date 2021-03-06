// Flutter imports:
// Project imports:
import 'package:delivery_system/views/homes/home_page.dart';
import 'package:delivery_system/views/logins/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          elevation: 1,
          shadowColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[900],
            fontSize: 14,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: InputBorder.none,
          focusColor: null,
          prefixStyle: TextStyle(
            color: Colors.red,
          ),
          suffixStyle: TextStyle(
            color: Colors.red,
          ),
//          fillColor: Colors.grey[700],
          fillColor: Colors.white,
          filled: true,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navButton(title: '?????????'),
            SizedBox(
              width: 500,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.grey[900],
                ),
                onPressed: () async {
                  await Navigator.of(context).push<dynamic>(
                    LoginPage.route(),
                  );
                },
                child: const Text('????????????'),
              ),
            ),
            SizedBox(
              width: 500,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.grey[900],
                ),
                onPressed: () async {
                  await Navigator.of(context).push<dynamic>(
                    HomePage.route(),
                  );
                },
                child: const Text('????????????'),
              ),
            ),
            navButton(title: '????????????'),
          ],
        ),
      ),
    );
  }

  Widget navButton({required String title, dynamic nav}) {
    return SizedBox(
      width: 500,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.grey[900],
        ),
        onPressed: null,
        child: Text(title),
      ),
    );
  }
}

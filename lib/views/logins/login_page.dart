import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';

class LoginPage extends HookWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
  }

  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCont,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                    ),
                    hintText: 'メールアドレス',
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordCont,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                    ),
                    hintText: 'パスワード',
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.5,
                child: GFButton(
                  text: 'ログイン',
                  color: GFColors.DARK,
                  padding: EdgeInsets.all(0),
                  onPressed: () => print('fdfd'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

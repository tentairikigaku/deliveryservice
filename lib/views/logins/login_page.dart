import 'package:delivery_system/commons/common_widget.dart';
import 'package:delivery_system/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hexcolor/hexcolor.dart';

Dialog otherDialog(BuildContext context, String str) {
  return Dialog(
    backgroundColor: Colors.white,
    child: SizedBox(
      height: 100,
      width: 200,
      child: Center(
        child: Text(
          str,
        ),
      ),
    ),
  );
}

Future<void> showOtherDialog(BuildContext context, String str) async {
  return showDialog(
    context: context,
    builder: (_) => otherDialog(context, str),
  );
}

Widget _otherArea(BuildContext context) {
  return Row(
    children: <Widget>[
      wSpacer(300),
      _otherContent(context, "利用規約"),
      wSpacer(30),
      _otherContent(context, "プライバシーポリシー"),
    ],
  );
}

Widget _otherContent(BuildContext context, String str) {
  return Container(
      child: GFButton(
    color: Colors.grey,
    text: str,
    onPressed: () async => showOtherDialog(context, str),
  ));
}

class LoginPage extends HookWidget {
  final emailCont = TextEditingController();

  final passwordCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    hSpacer(120),
                    Assets.images.cookpyLogo.image(
                      width: 220,
                    ),
                    Assets.images.orders.image(
                      width: 220,
                    ),
                    hSpacer(20),
                    Text(
                      "メールアドレス",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: HexColor('#4b4b4b'),
                          fontWeight: FontWeight.bold),
                    ),
                    hSpacer(2),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailCont,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0),
                          ),
                        ),
                      ),
                    ),
                    hSpacer(5),
                    Text(
                      'パスワード',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: HexColor('#4b4b4b'),
                        fontWeight: FontWeight.bold,
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
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0),
                          ),
//                    hintText: 'パスワード',
                        ),
                      ),
                    ),
                    hSpacer(20),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: GFButton(
                        text: 'ログイン',
                        textColor: HexColor('#725b00'),
                        color: HexColor('#ffcd0d'),
                        padding: EdgeInsets.all(0),
                        onPressed: () => print('fdfd'),
                      ),
                    ),
                    hSpacer(30),
                    Text('パスワードお忘れの場合はこちら'),
                    hSpacer(30),
                    Text(
                      "@cookpy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    hSpacer(50),
                    _otherArea(context),
                  ],
                ),
              ),
              Assets.images.group8.image(),
            ],
          ),
        ),
      ),
    );
  }

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
  }
}

import 'package:delivery_system/commons/common_widget.dart';
import 'package:delivery_system/commons/theme.dart';
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
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      const Expanded(
        child: Text(
          '@cookpy',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
      _otherContent(context, '利用規約'),
      _otherContent(context, 'プライバシーポリシー'),
    ],
  );
}

Widget _otherContent(BuildContext context, String str) {
  return Container(
    child: GFButton(
      textStyle: greyText(),
      color: Colors.transparent,
      text: str,
      onPressed: () async => showOtherDialog(context, str),
    ),
  );
}

class LoginPage extends HookWidget {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacer(60),
                  Center(
                    child: Assets.images.cookpyLogo.image(
                      width: 220,
                    ),
                  ),
                  Center(
                    child: Assets.images.orders.image(
                      width: 220,
                    ),
                  ),
                  hSpacer(20),
                  Text(
                    'メールアドレス',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HexColor('#4b4b4b'),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  hSpacer(2),
                  SizedBox(
                    height: 40,
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
                  hSpacer(20),
                  Text(
                    'パスワード',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HexColor('#4b4b4b'),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordCont,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 0),
                        ),
                      ),
                    ),
                  ),
                  hSpacer(20),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: GFButton(
                      text: 'ログイン',
                      size: GFSize.LARGE,
                      textColor: HexColor('#725b00'),
                      color: HexColor('#ffcd0d'),
                      padding: EdgeInsets.all(0),
                      onPressed: () => print('fdfd'),
                    ),
                  ),
                  hSpacer(20),
                  const Center(
                    child: Text('パスワードお忘れの場合はこちら'),
                  ),
                  hSpacer(20),
                  _otherArea(context),
                ],
              ),
            ),
            Expanded(
              child: Assets.images.group8.image(
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
  }
}

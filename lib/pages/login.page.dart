import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leitor_codigo_barras/components/components.dart';
import 'package:leitor_codigo_barras/pages/sheets.dart';

import 'package:leitor_codigo_barras/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              'Entrar',
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
          ),
          SvgPicture.asset(
            'assets/capture_icon.svg',
            height: 0.25 * size.height,
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: kPaddingDefault / 4,
            ),
            child: CircularTextField(
              hintText: 'Usuario ou e-mail',
              icon: Icons.person,
              onChanged: (value) {
                print('value do input -> $value');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: kPaddingDefault / 4,
              bottom: kPaddingDefault / 4,
            ),
            child: CircularTextField(
              hintText: 'Senha',
              icon: Icons.lock,
              onChanged: (value) {
                print('value do input -> $value');
              },
              isSuffixIcon: true,
              obscuteText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: kPaddingDefault / 4,
              bottom: kPaddingDefault,
            ),
            child: RoudedButton(
              'Entrar',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SheetsPage();
                    },
                  ),
                );
              },
              KColorSubtitle,
              KColorSubtitlePress,
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

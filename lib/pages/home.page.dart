import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leitor_codigo_barras/components/components.dart';
import 'package:leitor_codigo_barras/pages/login.page.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: SvgPicture.asset(
              'assets/icon.svg',
              height: 0.25 * size.height,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kPaddingDefault),
            child: Text(
              'Bem vindo ao Pro Reader',
              style: titleStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kPaddingDefault),
            child: Text(
              'Transforme seu celular em um leitor de codigo de barras, crie e prencha suas planilhas de forma automatizada',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                fontSize: 18,
                color: KColorSubtitle,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: kPaddingDefault / 4,
            ),
            child: RoudedButton(
              'Entrar',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              kPrymariColor,
              kPrymariColorPress,
              Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: kPaddingDefault / 4,
              bottom: kPaddingDefault,
            ),
            child: RoudedButton(
              'Cadastro',
              () {},
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leitor_codigo_barras/components/components.dart';
import 'package:leitor_codigo_barras/pages/capture.page.dart';
import 'package:leitor_codigo_barras/utils/sizes.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatelessWidget {
  final String iconPath = 'assets/icon.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.15 * getSizeScreen(context).height,
          ),
          Align(
            child: SvgPicture.asset(iconPath),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.15 * getSizeScreen(context).height),
            child: title('Bem vindo ao ProReader'),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 0.02 * getSizeScreen(context).height,
              left: 0.19 * getSizeScreen(context).width,
              right: 0.19 * getSizeScreen(context).width,
            ),
            child: subtitle(
                'Por favor, dê acesso a sua câmera para que possamos escanear e fornecer a você o código'),
          ),
          button('Vamos começar', context, navigate),
        ],
      ),
    );
  }

  void navigate(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CapturePage(),
        ));
  }
}

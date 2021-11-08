import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:leitor_codigo_barras/states/button.state.dart';
import 'package:leitor_codigo_barras/utils/sizes.dart';

Widget button(String text, BuildContext context, Function ontap) {
  Button buttonState = Button();

  return GestureDetector(
    onTapDown: (_) {
      buttonState.click();
    },
    onTapUp: (_) {
      buttonState.click();
    },
    onTap: () => {ontap(context)},
    child: Observer(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: buttonState.clicked ? Color(0xC2FD7E57) : Color(0xFFFD7E57),
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          margin: EdgeInsets.only(
            top: 0.3 * getSizeScreen(context).height,
            left: 0.05 * getSizeScreen(context).width,
            right: 0.05 * getSizeScreen(context).width,
          ),
          height: 0.075 * getSizeScreen(context).height,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget title(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget subtitle(subtitle) {
  return Text(
    subtitle,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFFC3C3C3),
      fontSize: 14,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
    ),
  );
}

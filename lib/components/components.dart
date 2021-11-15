import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/components/sheets.component.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

class CircularTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isSuffixIcon;
  final bool obscuteText;

  CircularTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.obscuteText = false,
    this.isSuffixIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamController<bool> _obscureTextState = StreamController<bool>();
    bool state = obscuteText;
    bool firstRender = true;

    return ContainerTextField(
      children: Padding(
        padding: const EdgeInsets.all(4),
        child: obscuteText
            ? StreamBuilder<bool>(
                stream: _obscureTextState.stream,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  state = firstRender ? state : !state;
                  firstRender = false;

                  return textField(
                    state,
                    suffixIcon: createSuffixIcon(_obscureTextState, state),
                  );
                })
            : textField(state),
      ),
    );
  }

  TextField textField(bool state, {Widget? suffixIcon}) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: state,
      onChanged: onChanged,
      style: textStyle(FontWeight.bold),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textStyle(FontWeight.w300),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          suffixIcon: suffixIcon),
    );
  }

  TextStyle textStyle(FontWeight weight) {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Nunito',
      fontWeight: weight,
      fontSize: 18,
    );
  }

  Widget createSuffixIcon(StreamController controller, bool state) {
    return GestureDetector(
      onTap: () {
        controller.sink.add(false);
      },
      child: Icon(
        state ? Icons.visibility : Icons.visibility_off,
        color: Colors.white,
      ),
    );
  }
}

class ContainerTextField extends StatelessWidget {
  final Widget children;
  const ContainerTextField({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: 0.9 * size.width,
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingDefault,
        vertical: kPaddingDefault / 4,
      ),
      decoration: BoxDecoration(
        color: kPrymariColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: children,
    );
  }
}

class RoudedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, pressColor, textColor;

  const RoudedButton(
    this.text,
    this.press,
    this.color,
    this.pressColor,
    this.textColor, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClickAnimation clickAnimation = ClickAnimation();

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        clickAnimation.click();
        press();
      },
      child: Container(
        width: size.width * 0.9,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
          child: StreamBuilder<bool>(
            stream: clickAnimation.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              return Container(
                color: clickAnimation.state ? color : pressColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kPaddingDefault,
                    horizontal: kPaddingDefault * 2,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: clickAnimation.state
                          ? textColor
                          : textColor.withOpacity(0.5),
                      fontFamily: 'Nunito',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

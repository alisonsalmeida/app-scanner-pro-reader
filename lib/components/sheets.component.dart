import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

class ClickAnimation {
  final StreamController<bool> _controller = StreamController<bool>();
  bool _state = true;

  void click() async {
    _state = false;
    _controller.sink.add(_state);
    await Future.delayed(
      Duration(
        milliseconds: 150,
      ),
    );
    _state = true;
    _controller.sink.add(_state);
  }

  Stream<bool> get stream => _controller.stream;
  bool get state => _state;
}

// ignore: must_be_immutable
class HeaderBar extends StatelessWidget {
  Widget? icon;
  final String title;

  HeaderBar(
    this.title, {
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: kPrymariColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64),
          bottomRight: Radius.circular(64),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: kPaddingDefault * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              Container(
                child: icon == null ? Container() : icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SheetItem extends StatelessWidget {
  SheetItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: kPaddingDefault / 4,
        horizontal: kPaddingDefault / 2,
      ),
      width: 0.90 * size.width,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingDefault / 2,
          horizontal: kPaddingDefault,
        ),
        child: Row(
          children: [
            IconSheet(),
            FileInfo(),
            ActionsIcons(),
          ],
        ),
      ),
    );
  }
}

class IconSheet extends StatelessWidget {
  const IconSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ClickAnimation clickAnimation = ClickAnimation();

    return GestureDetector(
      onTap: () async {
        clickAnimation.click();
      },
      child: StreamBuilder<Object>(
        stream: clickAnimation.stream,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: clickAnimation.state ? Colors.white : kPrymariColorPress,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    color: kPrymariColor,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/sheet.svg',
                    height: size.height * 0.03,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FileInfo extends StatelessWidget {
  const FileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Arquivo',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
            color: Colors.black.withAlpha(200),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ActionsIcons extends StatelessWidget {
  ActionsIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          SuffixIcon(
            icon: Icons.delete,
          ),
          SuffixIcon(icon: Icons.download),
        ],
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  final IconData icon;
  SuffixIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClickAnimation clickAnimation = ClickAnimation();

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTapDown: (_) async {
        clickAnimation.click();
      },
      child: StreamBuilder<bool>(
        stream: clickAnimation.stream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return Container(
            margin: EdgeInsets.only(
              right: kPaddingDefault / 4,
            ),
            decoration: BoxDecoration(
              color: clickAnimation.state
                  ? const Color(0xFFF5F5F5)
                  : KColorSubtitlePress,
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                icon,
                color: kPrymariColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddSheetButton extends StatelessWidget {
  final Function onPress;
  AddSheetButton(
    this.onPress, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClickAnimation clickAnimation = ClickAnimation();

    return GestureDetector(
      onTap: () async {
        clickAnimation.click();
        onPress();
      },
      child: StreamBuilder<bool>(
        stream: clickAnimation.stream,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: clickAnimation.state ? kPrymariColor : kPrymariColorPress,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            margin: EdgeInsets.only(
              bottom: kPaddingDefault,
              right: kPaddingDefault,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

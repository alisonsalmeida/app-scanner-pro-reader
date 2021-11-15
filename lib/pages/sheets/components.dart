import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/components/sheets.component.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

class InputNameSheet extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const InputNameSheet(
    this.onChanged, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: KColorSubtitle,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            onChanged: onChanged,
            autocorrect: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Nome do documento',
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class FieldSheetItem extends StatelessWidget {
  final Function onDelete;
  final int index;

  FieldSheetItem(
    this.onDelete,
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
          // color: index % 2 == 0 ? KColorSubtitle : Color(0x8FC3C3C3),
          color: KColorSubtitle,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DescriptionItem(),
            Expanded(
              child: InputTextItem(),
            ),
            DeleteItemField(onDelete, this),
          ],
        ),
      ),
    );
  }
}

class DescriptionItem extends StatelessWidget {
  DescriptionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Coluna:',
      style: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}

class InputTextItem extends StatelessWidget {
  const InputTextItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kPaddingDefault / 2),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Nome da coluna',
          border: InputBorder.none,
          hintStyle: textStyle(FontWeight.w300),
        ),
        style: textStyle(FontWeight.bold),
      ),
    );
  }

  TextStyle textStyle(FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: fontWeight,
      color: Colors.white,
    );
  }
}

class DeleteItemField extends StatelessWidget {
  final Function ontap;
  final FieldSheetItem parent;

  const DeleteItemField(
    this.ontap,
    this.parent, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClickAnimation clickAnimation = ClickAnimation();
    return StreamBuilder<Object>(
      stream: clickAnimation.stream,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            clickAnimation.click();
            ontap(parent);
          },
          child: Container(
            decoration: BoxDecoration(
              color: clickAnimation.state ? null : Colors.black45,
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: kPaddingDefault / 2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

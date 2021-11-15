import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/components/sheets.component.dart';
import 'package:leitor_codigo_barras/pages/sheets/create.page.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

class SheetsPage extends StatelessWidget {
  const SheetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrymariColor,
      ),
      body: Column(
        children: [
          HeaderBar(
            'Planilhas',
            icon: Image.asset('assets/sheet-list.png'),
          ),
          SizedBox(
            height: size.height * 0.8,
            child: ListView(
              children: [
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
                // SheetItem(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: AddSheetButton(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SheetCreate();
            },
          ),
        );
      }),
    );
  }
}

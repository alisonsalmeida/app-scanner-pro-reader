import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:leitor_codigo_barras/components/components.dart';
import 'package:leitor_codigo_barras/components/sheets.component.dart';
import 'package:leitor_codigo_barras/pages/sheets/components.dart';
import 'package:leitor_codigo_barras/pages/stores/create.store.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

// class SheetCreate extends StatefulWidget {
//   SheetCreate({Key? key}) : super(key: key);

//   @override
//   State<SheetCreate> createState() => _SheetCreateState();
// }

// class _SheetCreateState extends State<SheetCreate> {
//   List<FieldSheetItem> items = [];
//   String? name;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void addItem(FieldSheetItem item) async {
//     setState(() {
//       items.add(item);
//     });
//   }

//   void onDelete(FieldSheetItem item) {
//     setState(() {
//       items.removeWhere((element) => element.hashCode == item.hashCode);
//     });
//   }

//   void createSheet() {
//     jsonEncode(<String, String?>{
//       'name': name,
//       'fields': [].toString(),
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     StreamController<FieldSheetItem> itemsController =
//         StreamController<FieldSheetItem>();
//     Stream<FieldSheetItem> itemsStream = itemsController.stream;

//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: kPrymariColor,
//         actions: [
//           AddSheetButton(
//             () {
//               FieldSheetItem item = FieldSheetItem(this.onDelete, items.length);
//               addItem(item);
//               itemsController.sink.add(item);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           HeaderBar('Criar nova planilha'),
//           InputNameSheet(),
//           Flexible(
//             child: StreamBuilder<FieldSheetItem>(
//               stream: itemsStream,
//               builder: (context, AsyncSnapshot<FieldSheetItem> snapshot) {
//                 return Container(
//                   width: size.width * 0.9,
//                   child: ListView.builder(
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4),
//                           child: items[index]);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               top: kPaddingDefault / 4,
//               bottom: kPaddingDefault,
//             ),
//             child: RoudedButton(
//               'Salvar',
//               () {
//                 createSheet();
//               },
//               KColorSubtitle,
//               KColorSubtitlePress,
//               Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SheetCreate extends StatelessWidget {
  SheetCreate({Key? key}) : super(key: key);

  CreateStore _createStore = CreateStore();

  void updateName(String value) {
    _createStore.name(value);
  }

  @override
  Widget build(BuildContext context) {
    StreamController<FieldSheetItem> itemsController =
        StreamController<FieldSheetItem>();

    Stream<FieldSheetItem> itemsStream = itemsController.stream;

    Size size = MediaQuery.of(context).size;
    // List<FieldSheetItem> items = [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrymariColor,
        actions: [
          AddSheetButton(
            () {
              // _createStore?.addField('Hello');
              // FieldSheetItem item = FieldSheetItem(this.onDelete, items.length);
              // addItem(item);
              // itemsController.sink.add(item);
              _createStore.addField('heii');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          HeaderBar('Criar nova planilha'),
          InputNameSheet(updateName),
          Flexible(
            child: Observer(
              builder: (BuildContext context) {
                print(_createStore.createSheet?.name);

                return Container(
                  width: size.width * 0.9,
                  child: ListView.builder(
                    itemCount: _createStore.length,
                    itemBuilder: (context, index) {
                      print('$index');

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text('ola'),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: kPaddingDefault / 4,
              bottom: kPaddingDefault,
            ),
            child: RoudedButton(
              'Salvar',
              () {
                // createSheet();
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

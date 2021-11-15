// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:leitor_codigo_barras/components/components.dart';
// import 'package:leitor_codigo_barras/states/capture.state.dart';
// import 'package:leitor_codigo_barras/utils/sizes.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:lottie/lottie.dart';
// import 'package:adaptive_dialog/adaptive_dialog.dart';
// import 'package:alert/alert.dart';

// class CapturePage extends StatelessWidget {
//   final String captureIconPath = 'assets/capture_icon.json';
//   final CaptureState captureState = CaptureState();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             height: 0.05 * getSizeScreen(context).height,
//           ),
//           Container(
//             alignment: Alignment.center,
//             child: title('Scanner ProReader'),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               top: 0.02 * getSizeScreen(context).height,
//               left: 0.03 * getSizeScreen(context).width,
//               right: 0.03 * getSizeScreen(context).width,
//             ),
//             child: subtitle(
//                 'Coloque o código dentro do frame para fazer a varredura, evite balançar para obter resultados rapidamente'),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 0.15 * getSizeScreen(context).height),
//             child: Lottie.asset(
//               captureIconPath,
//               height: 165,
//               width: 165,
//             ), // SvgPicture.asset(captureIconPath),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 0.01 * getSizeScreen(context).height),
//             child: Observer(
//               builder: (BuildContext context) {
//                 return codeCaptured(
//                     'Codigo lido:  ${captureState.code}', context);
//               },
//             ),
//           ),
//           button('Capturar', context, getCode)
//         ],
//       ),
//     );
//   }

//   void getCode(BuildContext context) async {
//     String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         '#ff0000', 'Cancelar', true, ScanMode.BARCODE);

//     responseGetCode(barcodeScanRes);
//   }

//   void responseGetCode(code) {
//     if (code == '-1') {
//       captureState.setDefault();
//     } else {
//       captureState.setCode(code);
//     }
//   }

//   Widget codeCaptured(String text, BuildContext context) {
//     Text textCode = Text(
//       text,
//       style: TextStyle(
//         color: Color(0xFFC3C3C3),
//         fontWeight: FontWeight.bold,
//         fontFamily: 'Nunito',
//         fontSize: 24,
//       ),
//     );

//     return Container(
//       child: Container(
//         margin: EdgeInsets.only(
//           left: 0.1 * getSizeScreen(context).width,
//           right: 0.1 * getSizeScreen(context).width,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             textCode,
//             uploadIcon(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget uploadIcon(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         captureState.clickUpload(true);
//       },
//       onTapUp: (TapUpDetails details) async {
//         captureState.clickUpload(false);

//         if (captureState.captureModel.captured) {
//           DialogTextField dialogTextField = DialogTextField(
//             keyboardType: TextInputType.text,
//             hintText: 'Insira a descrição',
//           );

//           final result = await showTextInputDialog(
//             context: context,
//             textFields: [dialogTextField],
//             okLabel: 'Enviar',
//           );

//           if (result != null) {
//             bool codeRequest =
//                 await captureState.store(captureState.code, result[0]);
//             if (codeRequest) {
//               Alert(message: 'Enviado com sucesso').show();
//               captureState.setDefault();
//             } else {
//               Alert(message: 'Falha ao enviar codigo');
//             }
//           }
//         } else {
//           Alert(message: 'Leia um codigo valido').show();
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.only(bottom: 10),
//         child: Observer(
//           builder: (BuildContext context) {
//             return SvgPicture.asset(
//               'assets/icon_upload.svg',
//               width: 40,
//               height: 40,
//               color: captureState.colorUploadIcon,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

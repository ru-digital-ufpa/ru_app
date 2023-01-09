// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:ru_app/data/ru_data.dart';
// import 'package:provider/provider.dart';

// void UpdateCardapioDoDia() {
//   List<dynamic> updateCardapioDoDia = [];
//   List<dynamic> cardapio = [];
//   cardapio = Provider.of<Data>(context).cardapio;
//   for (int i = 0; i < cardapio.length;) {}
// }

// class CardapioDeHoje extends StatelessWidget {
//   const CardapioDeHoje({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Text(
//             DateFormat('dd-MM-yyyy').format(DateTime.now()),
//             style: TextStyle(
//               fontSize: 50,
//             ),
//           ),
//           Text(
//             DateFormat('dd-MM-yyyy')
//                 .format(DateTime.now().add(new Duration(days: 1))),
//             style: TextStyle(
//               fontSize: 50,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

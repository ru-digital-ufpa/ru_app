import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_drawer.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'RU DIGITAL',
          style: TextStyle(
            color: kNavbarBackgroundColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: kSecondaryColor,
              child: Image.asset(
                'images/ufpa_logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Provider.of<Data>(context).cardapio.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                RuDivider(name: 'Hoje'),
                RuCard(
                  refeicao: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['refeicao'],
                  nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                      ['amoco']['nomeDaRefei'],
                  vegetariano: Provider.of<Data>(context).cardapio[index]
                      ['amoco']['vegetariano1'],
                  comida1: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo1'],
                  comida2: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo2'],
                  comida3: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo3'],
                  comida4: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo4'],
                  comida5: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo5'],
                  refeicaoJantar: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['refeicao'],
                  nomeDaRefiJanter: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['nomeDaRefei'],
                  vegetarianoJanter: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['vegetariano2'],
                  comidaJanter1: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan1'],
                  comidaJanter2: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan2'],
                  comidaJanter3: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan3'],
                  comidaJanter4: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan4'],
                  comidaJanter5: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan5'],
                ),
              ],
            );
          },
        ),
      ),
      drawer: RuDrawer(),
      // bottomNavigationBar: BottomAppBar(
      //   color: kNavbarBackgroundColor,
      //   child: Row(
      //     children: [
      //       Icon(
      //         Icons.menu,
      //         color: kSecondaryColor,
      //         size: 50,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

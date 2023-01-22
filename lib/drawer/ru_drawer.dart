import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/screens/todo_cardapio_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ru_app/drawer/ru_drawer_list_tile.dart';

final Uri termoUrl = Uri.parse(
    'https://sites.google.com/view/privacidade-ru-digital/in%C3%ADcio');
final Uri historyUrl = Uri.parse('https://saest.ufpa.br/ru/index.php/d-2');
final Uri precosUrl = Uri.parse('https://saest.ufpa.br/ru/index.php/valores');
final Uri acessoFacilRuUrl =
    Uri.parse('https://sipac.ufpa.br/sipac/?modo=cçassico');

class RuDrawer extends StatelessWidget {
  const RuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Flexible(
            child: SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                  right: 5,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Text(
                  'RU DIGITAL',
                  style: TextStyle(
                    color: kNavbarBackgroundColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                RuDrawerListTile(
                  iconColor: kCardapioIconColor,
                  icon: Icons.food_bank,
                  title: 'Cardápio completo',
                  onPress: () {
                    Navigator.pushNamed(context, TodoCardapioScreen.id);
                  },
                ),
                RuDrawerListTile(
                  icon: Icons.price_change,
                  iconColor: kPrecoIconColor,
                  title: 'Preço do bandejão',
                  onPress: (() async {
                    if (await canLaunchUrl(precosUrl)) {
                      await launchUrl(precosUrl);
                    }
                  }),
                ),
                RuDrawerListTile(
                  icon: Icons.payment,
                  iconColor: kCartaoColor,
                  title: 'Recarregar seu cartão',
                  onPress: (() async {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Abrir no Navegador'),
                        content: const Text(
                            'https://sipac.ufpa.br. \nEste link vai abrir no navegador, você quer continuar?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Não'),
                            child: const Text(
                              'Não',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (await canLaunchUrl(acessoFacilRuUrl)) {
                                await launchUrl(
                                  acessoFacilRuUrl,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context, 'Sim');
                            },
                            child: const Text(
                              'Sim',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                RuDrawerListTile(
                  icon: Icons.history_edu,
                  iconColor: kHistoricoColor,
                  title: 'Histórico do RU',
                  onPress: (() async {
                    if (await canLaunchUrl(historyUrl)) {
                      await launchUrl(historyUrl);
                    }
                  }),
                ),
              ],
            ),
          ),

          // const SizedBox(
          //   height: 5,
          // ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                RuDrawerListTile(
                  icon: Icons.group,
                  iconColor: kTermoColor,
                  title: 'Termo de uso e privacidade',
                  onPress: () async {
                    if (await canLaunchUrl(termoUrl)) {
                      await launchUrl(termoUrl);
                    }
                  },
                ),
                const SizedBox(
                  child: Card(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: 5,
                    ),
                    elevation: 5,
                    color: kInfoTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Text(
                        'Este aplicativo é um projeto de um aluno da Universidade Federal do Pará - UFPA, portanto não é oficial da Superintendência de Assistência Estudantil – SAEST/UFPA.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/font_do_site.dart';

class HistoricoDoRu extends StatelessWidget {
  static String id = "HistoricoDoRu";

  const HistoricoDoRu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
        title: const Text(
          'Cardápio completo da semana',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 32,
                    bottom: 20,
                  ),
                  child: Text(
                    'Histórico',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'O Restaurante Universitário da UFPA foi inaugurado em 01 de outubro de 1993, e iniciou suas atividades em 13 de outubro do mesmo ano, com sua estrutura física projetada para o atendimento de até 1.200 refeições.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'O Projeto Arquitetônico, criado pelo Arquiteto João de Castro Filho, se fundamentou nos princípios do amazonismo arquitetural que propõe para a Amazônia, entre outras coisas, uma arquitetura construída a partir de uma árvore. Uma árvore que nasce, cresce e cria sombra. Sombra ventilada.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'O Restaurante passou a estar vinculado à Superintendência de Assistência Estudantil – SAEST em outubro de 2017, fazendo parte da Diretoria de Assistência Estudantil – DISAE.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Em 29 de maio de 2009 foi inaugurado a unidade do Restaurante Universitário do Setor Profissional.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' Em 01 de julho de 2010 foi inaugurado as novas instalações da Cozinha Central e o Complexo de Armazenamento do Restaurante Universitário localizado no Setor Básico.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Em 31 de agosto de 2015 foi inaugurado o novo refeitório da unidade do Setor Básico.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Em 28 de agosto de 2019 foi inaugurada a ampliação do refeitório do Restaurante universitário do Setor Profissional com 140 lugares.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Em 14 de fevereiro de 2020 foi realizada a entrega da obra de revitalização total do Sistema Elétrico da Unidade do Setor Básico.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'A constante preocupação de um atendimento de excelência tem levado o RU a permanentes mudanças, passando no decorrer desses anos por diversas reformas em sua estrutura física para adequação à legislação vigente, além de aquisição de equipamentos, modificação do cardápio, contratação e treinamento de pessoal, modernização dos serviços com a informatização da aquisição de material via agenda de compras, implantação da rede de Internet, elaboração e implantação do Manual de Boas Práticas de Fabricação de Alimentos, monitoramento de coleta de amostras e controle de temperatura de produtos prontos, abertura de vagas para estágio curricular e extra curricular de discentes do curso de Nutrição e áreas afins, dentre outras.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Grandes conquistas aconteceram ao longo desses anos e com o esforço e dedicação da equipe de trabalho e apoio da administração superior, com certeza, outras virão em prol do melhor atendimento à comunidade universitária, oferecendo uma refeição de qualidade com segurança alimentar.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'UNIDADES DO RU',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'O RU do Campus básico conta com uma cozinha industrial para a produção de 7.000 refeições diárias. E possui um refeitório com 436 lugares.',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'O RU do Campus profissional entrou em funcionamento em junho de 2009, servindo como uma unidade de distribuição, recebendo as refeições da unidade do campus básico. Contando com um refeitório de 300 lugares',
                  style: kHisTextStyle,
                  textAlign: kHisTextAling,
                ),
                SizedBox(
                  height: 20,
                ),
                FontDoSite(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

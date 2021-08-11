import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) alternarMarcacao;

  const TabuleiroWidget({
    Key? key,
    required this.tabuleiro,
    required this.onAbrir,
    required this.alternarMarcacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((itemCampo) {
          return CampoWidget(
              campo: itemCampo,
              onAbrir: onAbrir,
              alternarMarcacao: alternarMarcacao);
        }).toList(),
      ),
    );
  }
}

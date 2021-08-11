import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 12,
    colunas: 12,
    qtdeBombas: 3,
  );

  void _reiniciar() {
    print('Reiniciado');
  }

  void _abrir(Campo campo) {
    setState(() {
      try {
        campo.abrir();
      } on ExplosaoException {}
    });
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternando marcação');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: _tabuleiro,
            onAbrir: _abrir,
            alternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}

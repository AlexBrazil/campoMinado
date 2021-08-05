import 'dart:math';
import 'campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdeBombas;
  final List<Campo> _campos = [];

  Tabuleiro({
    required this.linhas,
    required this.colunas,
    required this.qtdeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  void _reiniciar() {
    _campos.forEach((campo) {
      campo.reiniciar();
      _sortearMinas();
    });
  }

  void _revelarBombas() {
    _campos.forEach((campo) {
      campo.revelarBombar();
    });
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionaVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    if (qtdeBombas > linhas * colunas) {
      return;
    }

    while (sorteadas < qtdeBombas) {
      int i = Random().nextInt(_campos.length);
      if (!_campos[i].minado) {
        _campos[i].minar();
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolvido {
    // Every rtorna verdadeiro se todos os campos estiverem resolvido
    return _campos.every((campo) => campo.resolvido);
  }
}

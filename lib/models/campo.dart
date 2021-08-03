import 'package:campo_minado/models/explosao_exception.dart';

class Campo {
  // Valores constantes do campo
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  // Valores variáveis do campo
  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  // Se o campo foi responsável pelo fim do jogo
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionaVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();
    // Estou recebendo o próprio campo
    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    // Achando os vizinhos
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }
    _aberto = true;

    // GameOver
    if (_minado) {
      _explodido = true;
      // Vamos lançar uma exceção
      throw ExplosaoException();
    }
    // Vamos usar recursividade - o método abrir() vai chamar novamente abrir()
    // O objetivo é abrir os vizinhos que não tenham bomba
    if (vizinhacaSegura) {
      vizinhos.forEach((elementVizinho) => elementVizinho.abrir());
    }
  }

  //Quando GameOver as bombas devem ser reveladas sem chamar o método abrir()
  void revelarBombar() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  // Voltar aos valores padrões
  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  // Campo resolvido é aquele que já revelou o que precisa ser feito
  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhacaSegura {
    // EVERY - todos os itens da lista devem atender uma determinada lógica
    // No caso, não devem estar minados
    return vizinhos.every((elementVizinho) => !elementVizinho.minado);
  }

  //Retorna o número de minas na vizinhança
  int get dtdeMinasNaVizinhanca {
    return vizinhos.where((elementVizinho) => elementVizinho.minado).length;
  }
}

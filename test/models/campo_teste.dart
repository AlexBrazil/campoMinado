//https://www.youtube.com/watch?v=7B6AtSMvX9k
import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir campo COM explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.minar();
      expect(c.abrir, throwsException);
    });
    test('Abrir campo SEM explosão', () {});
    test('Adicinar NÃO vizinho', () {});
    test('Adicionar vizinho', () {});
  });
}

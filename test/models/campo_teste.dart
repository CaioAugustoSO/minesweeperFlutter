import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/campo.dart';

main() {
  group('Campo', () {
    test('Abrir campo COM Explosão', () {
      Campo c = Campo(row: 0, column: 0);
      c.markasMined();
      expect(c.open, throwsException);
    });

    test('Abrir campo SEM Explosão', () {
      Campo c = Campo(row: 0, column: 0);
      c.open();
      expect(c.opened, isTrue);
    });
    test('Adicionar NÃO vizinho', () {
      Campo c1 = Campo(row: 0, column: 0);
      Campo c2 = Campo(row: 1, column: 3);
      c1.addNeighbors(c2);
      expect(c1.neighbors.isEmpty, isTrue);
    });
    test('Adicionar vizinho', () {
      Campo c1 = Campo(row: 3, column: 3);
      Campo c2 = Campo(row: 3, column: 4);
      Campo c3 = Campo(row: 2, column: 2);
      Campo c4 = Campo(row: 4, column: 4);
      c1.addNeighbors(c2);
      c1.addNeighbors(c3);
      c1.addNeighbors(c4);
      expect(c1.neighbors.length, 3);
    });
    test('Minas na vizinhaça', () {
      Campo c1 = Campo(row: 3, column: 3);
      Campo c2 = Campo(row: 3, column: 4);
      c2.markasMined();
      Campo c3 = Campo(row: 2, column: 2);
      Campo c4 = Campo(row: 4, column: 4);
      c4.markasMined();
      c1.addNeighbors(c2);
      c1.addNeighbors(c3);
      c1.addNeighbors(c4);
      expect(c1.qntofMinesinNeighbourhood, 2);
    });
  });
}

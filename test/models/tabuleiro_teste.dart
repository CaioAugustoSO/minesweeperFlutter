import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/board.dart';

main() {
  test('Ganhar', () {
    Board board = Board(
      rows: 2,
      columns: 2,
      qntofBombs: 0,
    );
    board.campos[0].markasMined();
    board.campos[3].markasMined();

    //Playing...
    board.campos[0].alternateMark();
    board.campos[1].open();
    board.campos[2].open();
    board.campos[3].alternateMark();

    expect(board.resolved, isTrue);
  });
}

import 'dart:math';

import 'campo.dart';
import 'package:flutter/foundation.dart';

class Board {
  final int rows;
  final int columns;
  final int qntofBombs;

  final List<Campo> _campos = [];

  Board({
    required this.rows,
    required this.columns,
    required this.qntofBombs,
  }) {
    _createField();
    _relacionateNeighbors();
    _drawnUndermines();
  }

  void revealBombs() {
    _campos.forEach((c) => c.revealBomb());
  }

  void restart() {
    _campos.forEach((c) => c.restart());
    _drawnUndermines();
  }

  void _createField() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        _campos.add(Campo(row: r, column: c));
      }
    }
  }

  void _relacionateNeighbors() {
    for (var field in _campos) {
      for (var neighbor in _campos) {
        field.addNeighbors(neighbor);
      }
    }
  }

  void _drawnUndermines() {
    //i don't know how do i write this word in english (the word in the variable), but this counts the drawn undermines
    int sorteado = 0;
    if (qntofBombs > rows * columns) {
      return;
    }
    while (sorteado < qntofBombs) {
      int i = Random().nextInt(_campos.length);

      if (_campos[i].mined) {
        sorteado++;
        _campos[i].markasMined();
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolved {
    return _campos.every((c) => c.resolved);
  }
}

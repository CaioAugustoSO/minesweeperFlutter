import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Campo {
  final int row;
  final int column;
  final List<Campo> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _undermine = false;
  bool _exploded = false;

  Campo({
    required this.row,
    required this.column,
  });

  void addNeighbors(Campo neigh) {
    final deltaRow = (row - neigh.row).abs();
    final deltaColumn = (column - neigh.column).abs();
    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neigh);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_undermine) {
      _exploded = true;
      throw ExplosionException();
    }
    if (safeNeighbourhood) {
      neighbors.forEach((n) => n.open());
    }
  }

  void revealBomb() {
    if (_undermine) {
      _opened = true;
    }
  }

  void markasMined() {
    _undermine = true;
  }

  void alternateMark() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _undermine = false;
    _exploded = false;
  }

  bool get mined {
    return _undermine;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get resolved {
    bool minedAndmarked = marked && mined;
    bool safeAndopened = !marked && !mined;
    return minedAndmarked || safeAndopened;
  }

  bool get safeNeighbourhood {
    return neighbors.every((n) => !n.mined);
  }

  int get qntofMinesinNeighbourhood {
    return neighbors.where((n) => n.mined).length;
  }
}

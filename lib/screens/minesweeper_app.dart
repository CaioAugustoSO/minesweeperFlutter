import 'package:flutter/material.dart';
import 'package:minesweeper/components/result_widget.dart';

class MineSweeperApp extends StatelessWidget {
  const MineSweeperApp({super.key});
  _restart() {
    print('reiniciado');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(won: true, onRestart: _restart()),
        body: Container(
          child: const Text('Board'),
        ),
      ),
    );
  }
}

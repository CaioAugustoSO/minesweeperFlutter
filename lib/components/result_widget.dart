import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  const ResultWidget({super.key, required this.won, required this.onRestart});

  final bool won;
  final Function()? onRestart;

  Color _getColor() {
    if (won == null) {
      return Colors.yellow;
    } else if (won) {
      return Colors.green[300] as Color;
    } else {
      return Colors.red[300] as Color;
    }
  }

  IconData _getIcon() {
    if (won == null) {
      return Icons.sentiment_satisfied;
    } else if (won) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: _getColor(),
          child: IconButton(
              onPressed: onRestart,
              icon: Icon(_getIcon(), color: Colors.black, size: 35)),
        ),
      )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}

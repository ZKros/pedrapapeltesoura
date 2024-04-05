import 'package:flutter/material.dart';

class Placar extends StatelessWidget {
  const Placar({
    Key? key,
    required String playerName,
    required int playerPoints,
  })  : _playerPoints = playerPoints,
        _playerName = playerName,
        super(key: key);

  final int _playerPoints;
  final String _playerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_playerName),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(7))),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(35),
          child: Text('$_playerPoints', style: TextStyle(fontSize: 26)),
        )
      ],
    );
  }
}

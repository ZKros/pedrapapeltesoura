import 'package:flutter/material.dart';

class BorderColor extends StatelessWidget {
  const BorderColor({
    Key? key,
    required Color borderColor,
    required String imgPlayer,
  })  : _borderColor = borderColor,
        _imgPlayer = imgPlayer,
        super(key: key);

  final Color _borderColor;
  final String _imgPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: _borderColor, width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Image.asset(
        _imgPlayer,
        height: 120,
      ),
    );
  }
}

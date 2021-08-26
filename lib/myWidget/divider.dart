import 'package:flutter/material.dart';
class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      color: Color(0xFFAC7439),
      thickness:  1.0,
    );
  }
}

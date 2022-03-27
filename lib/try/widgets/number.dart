import 'package:flutter/material.dart';

class Numbers1 extends StatelessWidget {
  int num;
  Numbers1({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Center(child: Text('$num')),
    );
  }
}

import 'package:flutter/material.dart';

class widgets1 extends StatelessWidget {
  int num;
  widgets1({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Center(child: Text('$num')),
    );
  }
}

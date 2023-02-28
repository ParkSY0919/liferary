import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/utilities/palette.dart';

class Left_sentence extends StatelessWidget {
  const Left_sentence({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
      child: Column(
        children: [
          Text(
            "Hi, We are Liferary. \n\n If you have any questions,"
            " \n\n here is answer. \n\n Because everything is here.",
            style: TextStyle(
              fontSize: 17,
              // fontWeight: FontWeight.bold,
              color: Palette.white,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

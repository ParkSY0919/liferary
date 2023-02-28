import 'package:flutter/material.dart';
import 'package:liferary/utilities/palette.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.5,
      width: _width * 0.9,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: children),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Palette.blue, width: 3),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(
                  1,
                  1,
                )),
          ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/createstudy.dart';
import 'package:liferary/utilities/palette.dart';

class CreateModal extends StatefulWidget {
  const CreateModal({super.key});

  @override
  State<CreateModal> createState() => _CreateModalState();
}

class _CreateModalState extends State<CreateModal> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateStudyScreen()),
            );
          },
          child: Container(
            // alignment: Alignment.center,
            //comment
            width: _width * 0.4,
            height: _height * 0.05,
            decoration: BoxDecoration(
              color: Palette.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "create study",
                  style: TextStyle(fontSize: 17, color: Palette.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/utilities/palette.dart';

class Category_food extends StatelessWidget {
  const Category_food({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
      child: Column(
        children: [
          SizedBox(
            width: 5,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                child: Text("Food",
                    style: TextStyle(
                        fontSize: 15,
                        color: Palette.blue4,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  width: _width * 0.13,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "cook",
                      style: TextStyle(fontSize: 12, color: Palette.white),
                    ),
                  )),
              SizedBox(
                width: 5,
              ),
              Container(
                  width: _width * 0.13,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "menu",
                      style: TextStyle(fontSize: 12, color: Palette.white),
                    ),
                  )),
              SizedBox(
                width: 5,
              ),
              Container(
                  width: _width * 0.13,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "baking",
                      style: TextStyle(fontSize: 12, color: Palette.white),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

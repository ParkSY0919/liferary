import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/utilities/palette.dart';

class Category_health extends StatelessWidget {
  const Category_health({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 5,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                child: Text("Health",
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
                  width: _width * 0.17,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "exercise",
                      style: TextStyle(fontSize: 12, color: Palette.white),
                    ),
                  )),
              SizedBox(
                width: 5,
              ),
              Container(
                  width: _width * 0.17,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "hospital",
                      style: TextStyle(fontSize: 12, color: Palette.white),
                    ),
                  )),
              SizedBox(
                width: 5,
              ),
              Container(
                  width: _width * 0.19,
                  height: _height * 0.02,
                  decoration: BoxDecoration(
                    color: Palette.blue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "stretching",
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

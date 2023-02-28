import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/utilities/palette.dart';

class POST_vote extends StatefulWidget {
  const POST_vote({super.key});

  @override
  State<POST_vote> createState() => _POST_voteState();
}

class _POST_voteState extends State<POST_vote> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: _width * 0.7,
            height: _height * 0.04,
            decoration: BoxDecoration(
                color: Palette.blue, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "How was our service?",
              style: TextStyle(
                  color: Palette.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: _height * 0.20,
            width: _width * 0.8,
            decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Palette.black, width: 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1,
                        1,
                      )),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //감정들
              children: [
                /*Excellent*/
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CreateStudyScreen()),
                      // );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Icon(
                      Icons.sentiment_very_satisfied,
                      size: _width * 0.2,
                      color: Palette.blue4,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Excellent",
                    style: TextStyle(
                        color: Palette.blue5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  width: 50,
                ),

                /*Bad*/
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CreateStudyScreen()),
                      // );
                    },
                    child: Icon(
                      Icons.mood_bad,
                      size: _width * 0.2,
                      color: Palette.blue4,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bad",
                    style: TextStyle(
                        color: Palette.blue5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

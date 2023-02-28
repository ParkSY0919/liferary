import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/category/category_of_food.dart';
import 'package:liferary/category/category_of_health.dart';
import 'package:liferary/category/category_of_nonsense.dart';
import 'package:liferary/utilities/palette.dart';

class FullView_Modal extends StatefulWidget {
  const FullView_Modal({super.key});

  @override
  State<FullView_Modal> createState() => _FullView_ModalState();
}

class _FullView_ModalState extends State<FullView_Modal> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: _height * 0.4, // 모달 높이 크기
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 200,
                    ), // 모달 좌우하단 여백 크기
                    decoration: const BoxDecoration(
                      color: Palette.blue,
                      //배경색
                      borderRadius: BorderRadius.all(
                        Radius.circular(10), // 모달 전체 라운딩 처리
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: _width * 0.5,
                              height: _height * 0.04,
                              decoration: BoxDecoration(
                                color: Palette.blue3,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Choose your category!",
                                  style: TextStyle(
                                      fontSize: 13, color: Palette.white),
                                ),
                              )),
                        ),
                        Container(
                          width: _width * 0.87,
                          height: _height * 0.255,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: Palette.white),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                          child: Column(
                            children: [
                              Category_food(),
                              Category_health(),
                              Category_nonsense(),

                              //Done button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Palette.blue,
                                ),
                                child: Text(
                                  'Done!',
                                  style: TextStyle(color: Palette.white),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        )
                      ],
                    ), // 모달 내부 디자인 영역
                  );
                },
                backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
              );
            },
            child: Text(
              "Full View",
              style: TextStyle(
                  color: Palette.blue4,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontSize: 17),
            )),
      ],
    );
  }
}

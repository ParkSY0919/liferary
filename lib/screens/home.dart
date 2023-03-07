import 'package:flutter/material.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/category/fullview_category.dart';
import 'package:liferary/category/left_sentence.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/screens/share_write.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/main_posts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchController = TextEditingController();
  String? accessToken = null;
  Color category_modal_button = inactiveCardColor;

  static Color inactiveCardColor = Palette.blue4;
  static Color activeCardColor = Palette.blue;
  // 1 = male / 2 = female
  void updateColor(int gender) {
    if (gender == 1) {
      category_modal_button = activeCardColor;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _getToken() async {
    String? tokenValue = await GetSharedPreferencesValues()
        .getSharedPreferencesValue('accessToken');

    setState(() {
      accessToken = tokenValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final choice_category = [""];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Palette.white,
        // appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(children: [
                      Column(children: [
                        //logo
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
                              child: Container(
                                width: _width * 0.4,
                                height: _height * 0.04,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                              ),
                            ),
                            //welcome write
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Text(
                                "Welcome,\nusername!",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Palette.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: _width * 0.74,
                          height: _height * 0.05,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Palette.blue, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                            child: TextField(
                              controller: SearchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                iconColor: Palette.white,
                                labelText: 'Search',
                                labelStyle: TextStyle(color: Palette.blue),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Palette.blue3,
                              ),
                              child: Icon(
                                Icons.person,
                                size: _width * 0.1,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPage()),
                                );
                              },
                            ),
                          ),

                          //Logout button
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: accessToken != null
                                ? InkWell(
                                    child: Center(
                                        child: Container(
                                            width: _width * 0.2,
                                            height: _height * 0.03,
                                            decoration: BoxDecoration(
                                              color: Palette.blue3,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Logout",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.white),
                                              ),
                                            ))),

                                    //Logout 버튼 클릭시 네비게이션 작동
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  )
                                : InkWell(
                                    child: Center(
                                        child: Container(
                                            width: _width * 0.2,
                                            height: _height * 0.03,
                                            decoration: BoxDecoration(
                                              color: Palette.blue3,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.white),
                                              ),
                                            ))),

                                    //Logout 버튼 클릭시 네비게이션 작동
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  ),
                          ),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //   child: InkWell(
                          //     child: Center(
                          //         child: Container(
                          //             width: _width * 0.2,
                          //             height: _height * 0.03,
                          //             decoration: BoxDecoration(
                          //               color: Palette.blue3,
                          //               borderRadius: BorderRadius.circular(10),
                          //             ),
                          //             child: Center(
                          //               child: Text(
                          //                 "Logout",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     color: Palette.white),
                          //               ),
                          //             ))),

                          //     //Logout 버튼 클릭시 네비게이션 작동
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => LoginScreen()),
                          //       );
                          //     },
                          //   ),
                          // ),

                          ///////
                        ],
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //박스 시작
                        Container(
                          width: _width * 1,
                          height: _height * 0.65,
                          color: Palette.blue,
                          child: Column(children: [
                            Container(
                              width: _width * 0.9,
                              // color: Palette.black,
                              child: Column(
                                children: [Left_sentence()],
                              ),
                            ),

                            //하단
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    //choose part
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 5),
                                      child: Container(
                                          width: _width * 0.75,
                                          height: _height * 0.04,
                                          decoration: BoxDecoration(
                                            color: Palette.blue3,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Choose your category!",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Palette.white),
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    //white box
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        width: _width * 0.9,
                                        height: _height * 0.34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Palette.white),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      //food category
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 8, 8, 3),
                                                          child: Column(
                                                            children: [
                                                              Text("Food",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Palette
                                                                          .blue4,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    //menu, cook
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            width:
                                                                _width * 0.13,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "cook",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "menu",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    //realationship category
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 8, 8, 3),
                                                          child: Text(
                                                              "Relationship",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Palette
                                                                      .blue4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "letter",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )), //happy end
                                                        SizedBox(
                                                          width: 5,
                                                        ), //간격

                                                        Container(
                                                            //comment
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "comment",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 8, 8, 3),
                                                          child: Text("Health",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Palette
                                                                      .blue4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "hospital",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )), //hospital end
                                                        SizedBox(
                                                          width: 5,
                                                        ), //간격

                                                        Container(
                                                            //exercise
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "exercise",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 8, 8, 3),
                                                          child: Text(
                                                              "Nonesense",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Palette
                                                                      .blue4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "laugh",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                        SizedBox(
                                                          width: 5,
                                                        ), //간격

                                                        Container(
                                                            //happy
                                                            width:
                                                                _width * 0.12,
                                                            height:
                                                                _height * 0.02,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Palette.blue5,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "happy",
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Palette
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            /**dddd */
                                            /*여기로 이동*/
                                            //click here
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: _width * 0.3,
                                                      height: _height * 0.03,
                                                      decoration: BoxDecoration(
                                                        color: Palette.blue3,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.south,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                          Text(
                                                            "click here!",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Palette
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FullView_Modal(),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ), //mypage box end//

                        Row(
                          children: [
                            Padding(
                              //selected part
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: _width * 0.8,
                                height: _height * 0.045,
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Palette.blue, width: 2),
                                ),
                                child: Text(
                                  choice_category.isEmpty
                                      ? " Selected : "
                                      : " Selected : ${choice_category}",
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Palette.blue3,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: accessToken != null
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Palette.white,
                                        shape: CircleBorder(),
                                        side: BorderSide(
                                          color: Palette.blue,
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.create,
                                        size: _width * 0.09,
                                        color: Palette.blue4,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Share_writeScreen(),
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                        Main_Postbox(), //메인 포스트들
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: _width * 0.34,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Palette.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_left,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Prevoius Page',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  //   setState(() {
                                  //     if (postNumber != 0) {
                                  //       postNumber = postNumber - 1;
                                  //       postListView = listPost(postNumber);

                                  //       print('$postNumber');
                                  //     } else {
                                  //       FToast().showToast(
                                  //           child: Container(
                                  //               alignment: Alignment.center,
                                  //               width: 200,
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius
                                  //                           .circular(25),
                                  //                   color: ColorStyle
                                  //                       .mainColor),
                                  //               child: Text(
                                  //                 '처음 페이지 입니다.',
                                  //                 style: TextStyle(
                                  //                     color: Colors.white),
                                  //               )));
                                  //     }
                                  //   });
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: _width * 0.34,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Palette.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Next Page',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // setState(() {
                                  //   if (snapshot.data!.last == false) {
                                  //     postNumber = postNumber + 1;
                                  //     postListView = listPost(postNumber);

                                  //     print('$postNumber');
                                  //   } else {
                                  //     FToast().showToast(
                                  //         child: Container(
                                  //             alignment: Alignment.center,
                                  //             width: 200,
                                  //             decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius
                                  //                         .circular(25),
                                  //                 color: ColorStyle
                                  //                     .mainColor),
                                  //             child: Text(
                                  //               '마지막 페이지 입니다.',
                                  //               style: TextStyle(
                                  //                   color: Colors.white),
                                  //             )));
                                  //   }
                                  // });
                                },
                              ),
                            ],
                          ),
                        ) //하단 페이지 이동 버튼들 끝
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}

//버튼
// GestureDetector(
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: 120,
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                             color: ColorStyle.mainColor,
//                                             borderRadius:
//                                                 BorderRadius.circular(25)),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               '다음 페이지',
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                             Icon(
//                                               Icons.arrow_right,
//                                               color: Colors.white,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         setState(() {
//                                           if (snapshot.data!.last == false) {
//                                             postNumber = postNumber + 1;
//                                             postListView = listPost(postNumber);

//                                             print('$postNumber');
//                                           } else {
//                                             FToast().showToast(
//                                                 child: Container(
//                                                     alignment: Alignment.center,
//                                                     width: 200,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(25),
//                                                         color: ColorStyle
//                                                             .mainColor),
//                                                     child: Text(
//                                                       '마지막 페이지 입니다.',
//                                                       style: TextStyle(
//                                                           color: Colors.white),
//                                                     )));
//                                           }
//                                         });
//                                       },
//                                     ),

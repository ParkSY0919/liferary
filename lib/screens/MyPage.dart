import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/Styles/ColorStyles.dart';
import 'package:liferary/Styles/Styles.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        // appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(children: [
                      //logo
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
                        child: Container(
                          width: 160,
                          height: 40,
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

                      Column(
                        children: [
                          //person icon
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),

                          //Logout button
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
                            child: InkWell(
                              child: Center(
                                  child: Container(
                                      width: 75,
                                      height: 19,
                                      decoration: BoxDecoration(
                                        color: Palette.blue3,
                                        borderRadius: BorderRadius.circular(10),
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
                                      builder: (context) => LoginScreen()),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ]),
                    Column(
                      children: [
                        //박스 시작
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 350,
                          alignment: AlignmentDirectional.topStart,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Palette.blue),
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
                              //person icon _ in box
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 130, 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 108,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.blue),
                                  child: Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              //Full name part _ start
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Full name',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "Park",
                                      // '${snapshot.data!.username}',
                                      style: Styles.userPageBodyText,
                                    )),

                                    // SizedBox(
                                    //   height: 20,
                                    // ),

                                    //Telephone part
                                    Container(
                                      child: Text(
                                        'Telephone',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "+82 10-2267-9106",
                                      // '${snapshot.data!.nickname}',
                                      style: Styles.userPageBodyText,
                                    )),

                                    //E-mail part
                                    Container(
                                      child: Text(
                                        'E-mail',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "qhr498@naver.com",
                                      // '${snapshot.data!.nickname}',
                                      style: Styles.userPageBodyText,
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ), //mypage box end//
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
                    // Container(
                    //   height: 500,
                    //   child: DefaultTabController(
                    //     length: 2,
                    //     child: Scaffold(
                    //         appBar: AppBar(
                    //           automaticallyImplyLeading: false,
                    //           bottom: TabBar(
                    //               indicatorColor: ColorStyle.mainColor,
                    //               tabs: [
                    //                 Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Container(
                    //                     alignment: Alignment.center,
                    //                     width: 200,
                    //                     height: 70,
                    //                     decoration: BoxDecoration(
                    //                         color: ColorStyle.mainColor,
                    //                         borderRadius:
                    //                             BorderRadius.circular(15)),
                    //                     child: Text(
                    //                       '게시글 (${snapshot.data!.posts!.myContent!.length})',
                    //                       style: Styles.tabBarText,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Container(
                    //                     alignment: Alignment.center,
                    //                     width: 200,
                    //                     height: 70,
                    //                     decoration: BoxDecoration(
                    //                         color: ColorStyle.mainColor,
                    //                         borderRadius:
                    //                             BorderRadius.circular(15)),
                    //                     child: Text(
                    //                       '댓글 (${snapshot.data!.comments!.myContent!.length})',
                    //                       style: Styles.tabBarText,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ]),
                    //         ),
                    //         body: TabBarView(
                    //           children: [
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               alignment: Alignment.center,
                    //               child: ListView.builder(
                    //                   itemCount: snapshot
                    //                       .data!.posts!.myContent!.length,
                    //                   itemBuilder: ((context, index) {
                    //                     var conId = snapshot
                    //                         .data!.posts!.myContent![index].id;
                    //                     return Padding(
                    //                       padding: const EdgeInsets.all(8.0),
                    //                       child: GestureDetector(
                    //                         child: Container(
                    //                           width: MediaQuery.of(context)
                    //                                   .size
                    //                                   .width *
                    //                               0.9,
                    //                           height: 50,
                    //                           decoration: BoxDecoration(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(15),
                    //                               border: Border.all(
                    //                                   width: 1,
                    //                                   color: ColorStyle
                    //                                       .mainColor)),
                    //                           child: Row(children: [
                    //                             Container(
                    //                                 width: 50,
                    //                                 padding:
                    //                                     EdgeInsets.fromLTRB(
                    //                                         10, 0, 10, 0),
                    //                                 child: Text(typeStringKo(
                    //                                     snapshot
                    //                                         .data!
                    //                                         .posts!
                    //                                         .myContent![index]
                    //                                         .type))),
                    //                             Container(
                    //                               width: 1,
                    //                               height: 15,
                    //                               color: ColorStyle.mainColor,
                    //                             ),
                    //                             Container(
                    //                                 alignment: Alignment.center,
                    //                                 width: 200,
                    //                                 child: Text(
                    //                                     '${snapshot.data!.posts!.myContent![index].title}')),
                    //                             Padding(
                    //                               padding: const EdgeInsets.all(
                    //                                   10.0),
                    //                               child: Text(
                    //                                   '${snapshot.data!.posts!.myContent![index].modifiedDate.toString().substring(5, 16).replaceAll('T', '/')}'),
                    //                             )
                    //                           ]),
                    //                         ),
                    //                         onTap: () {
                    //                           Navigator.push(
                    //                               context,
                    //                               MaterialPageRoute(
                    //                                   builder: ((context) =>
                    //                                       Post(
                    //                                         id: conId,
                    //                                       ))));
                    //                         },
                    //                       ),
                    //                     );
                    //                   })),
                    //             ),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               alignment: Alignment.center,
                    //               child: ListView.builder(
                    //                   itemCount: snapshot
                    //                       .data!.comments!.myContent!.length,
                    //                   itemBuilder: ((context, index) {
                    //                     return Container(
                    //                       child: Card(
                    //                           elevation: 1,
                    //                           surfaceTintColor: Colors.white,
                    //                           child: Column(
                    //                             children: [
                    //                               Padding(
                    //                                 padding:
                    //                                     const EdgeInsets.all(
                    //                                         10.0),
                    //                                 child: Container(
                    //                                   alignment:
                    //                                       Alignment.topLeft,
                    //                                   child: Text(
                    //                                       '${snapshot.data!.comments!.myContent![index].context}'),
                    //                                 ),
                    //                               ),
                    //                               Padding(
                    //                                 padding:
                    //                                     const EdgeInsets.all(
                    //                                         10.0),
                    //                                 child: Container(
                    //                                   alignment:
                    //                                       Alignment.bottomRight,
                    //                                   child: Text(
                    //                                       '${snapshot.data!.comments!.myContent![index].modifiedDate.toString().substring(2, 16).replaceAll('T', ' ')}'),
                    //                                 ),
                    //                               )
                    //                             ],
                    //                           )),
                    //                     );
                    //                   })),
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ),
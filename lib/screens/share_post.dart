import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/POST/POST_read/post_vote.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                size: _width * 0.135,
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
                          //person icon
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //   child: Icon(
                          //     Icons.person,
                          //     size: _width * 0.18,
                          //     color: Colors.grey,
                          //   ),
                          // ),

                          //Logout button
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: InkWell(
                              child: Center(
                                  child: Container(
                                      width: _width * 0.2,
                                      height: _height * 0.03,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Tag : ",
                                style: TextStyle(
                                  color: Palette.blue4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                                child: Container(
                                  width: _width * 0.18,
                                  height: _height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Palette.blue5,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Food",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Palette.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    /*
                    Title Part
                    */
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: _width * 0.8,
                          height: _height * 0.04,
                          decoration: BoxDecoration(
                            color: Palette.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "How to get fired from your companys",
                              style:
                                  TextStyle(fontSize: 15, color: Palette.white),
                            ),
                          )),
                    ),

                    /*
                    본문 내용 시작
                    */

                    //First Picture
                    Container(
                      width: _width * 0.7,
                      height: _height * 0.3,
                      decoration: BoxDecoration(color: Palette.blue5),
                      child: Image(
                          color: Colors.white,
                          image: AssetImage('assets/images/logo.png')),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //1번
                    Container(
                      width: _width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "1. Do not your best",
                                style: TextStyle(
                                  color: Palette.blue4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Container(
                            height: 5,
                            color: Palette.blue3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: _width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry.",
                                style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    //second Picture
                    Container(
                      width: _width * 0.7,
                      height: _height * 0.3,
                      decoration: BoxDecoration(color: Palette.blue5),
                      child: Image(
                          color: Colors.white,
                          image: AssetImage('assets/images/logo.png')),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      width: _width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "2. Do everyday late",
                                style: TextStyle(
                                  color: Palette.blue4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Container(
                            height: 5,
                            color: Palette.blue3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: _width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "Contrary to popular belief, Lorem \nIpsum is not simply random text.",
                                style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    /**본문 종료 이후 하단 툴 시작**/
                    //vote part
                    POST_vote(),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        //study part
                        //community part
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )));
  }
}

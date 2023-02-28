import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

class CreateStudyScreen extends StatefulWidget {
  const CreateStudyScreen({super.key});

  @override
  State<CreateStudyScreen> createState() => _CreateStudyScreenState();
}

class _CreateStudyScreenState extends State<CreateStudyScreen> {
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
                          width: _width * 0.75,
                          height: _height * 0.06,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                            child: TextField(
                              controller: SearchController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                iconColor: Palette.white,
                                labelText: 'Search',
                                labelStyle: TextStyle(color: Palette.blue),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Palette.blue,
                                  ),
                                ),
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
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: Container(
                        height: _height * 0.6,
                        width: _width * 0.9,
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.close,
                                    size: _width * 0.09,
                                    color: Palette.blue4,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: _width * 0.9,
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Palette.blue, width: 2),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Please enter your study title',
                                      labelStyle:
                                          TextStyle(color: Palette.blue2)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                width: _width * 0.9,
                                height: _height * 0.3,
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Palette.blue, width: 2),
                                ),
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Please enter your study contents',
                                      labelStyle:
                                          TextStyle(color: Palette.blue2)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: _width * 0.4,
                                      height: _height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Palette.blue, width: 2),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'choose category',
                                            labelStyle: TextStyle(
                                                color: Palette.blue2)),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _width * 0.04,
                                    ),
                                    Container(
                                      width: _width * 0.4,
                                      height: _height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Palette.blue, width: 2),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your study link',
                                            labelStyle: TextStyle(
                                                color: Palette.blue2)),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Center(
                                    child: Container(
                                      //comment
                                      width: _width * 0.4,
                                      height: _height * 0.05,
                                      decoration: BoxDecoration(
                                          color: Palette.blue,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Palette.blue4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "registration",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Palette.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}

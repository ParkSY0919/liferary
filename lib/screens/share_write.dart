import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:liferary/API/postController.dart';
import 'package:liferary/category/choosehere_category.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/createstudy_modal.dart';

class Share_writeScreen extends StatefulWidget {
  const Share_writeScreen({super.key});

  @override
  State<Share_writeScreen> createState() => _Share_writeScreenState();
}

class _Share_writeScreenState extends State<Share_writeScreen> {
  final SearchController = TextEditingController();
  void getFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      print(result.names);
      writePostController.selectedFile = result;
      // 파일 사용하기
    } else {
      // 취소 버튼을 눌렀을 때 처리할 코드 작성
    }
  }

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
                        //박스 시작
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tag : ",
                              style: TextStyle(
                                color: Palette.blue4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ChooseCategory(),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                          child: Container(
                            width: _width * 0.9,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Palette.blue, width: 2),
                            ),
                            child: TextField(
                              controller: writePostController.titleController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter your title.',
                                  labelStyle: TextStyle(color: Palette.blue2)),
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
                              border: Border.all(color: Palette.blue, width: 2),
                            ),
                            child: TextField(
                              controller: writePostController.contextController,
                              textAlign: TextAlign.left,
                              autofocus: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write your tips contents',
                                  labelStyle: TextStyle(color: Palette.blue2)),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),

                        Row(
                          //files
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 25, 60),
                              child: Container(
                                //comment
                                width: _width * 0.23,
                                height: _height * 0.05,
                                decoration: BoxDecoration(
                                  color: Palette.blue5,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: getFile,
                                        icon: Icon(
                                          Icons.upload_file,
                                          size: _width * 0.09,
                                          color: Palette.white,
                                        )),
                                    Text(
                                      "Files",
                                      style: TextStyle(
                                          fontSize: 14, color: Palette.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CreateModal(),
                                SizedBox(
                                  width: _width * 0.09,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    //comment
                                    width: _width * 0.4,
                                    height: _height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Palette.blue,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Palette.blue4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "youtube",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Palette.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: GestureDetector(
                                child: Container(
                                  //comment
                                  width: _width * 0.4,
                                  height: _height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Palette.blue,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Palette.blue4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "registration",
                                        style: TextStyle(
                                            fontSize: 17, color: Palette.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  writePostController.postWrite();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              HomeScreen())));
                                },
                              ),
                            ),
                          ],
                        ),
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

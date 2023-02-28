import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/liferary_sighup_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String password = '';
  String repeatedPassword = '';
  SigninController signinController = SigninController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
        child: Center(
          child: Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SignupContainer(children: [
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Palette.blue,
                  ),
                ),

                //email
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                    child: TextField(
                      controller: signinController.emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.badge),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Palette.blue2,
                                width: 1.0,
                              )),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Palette.blue2)),
                    ),
                  ),
                ),

                //nickname
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: TextField(
                    controller: signinController.nicknameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Palette.blue2,
                              width: 1.0,
                            )),
                        labelText: 'Nick_name',
                        labelStyle: TextStyle(color: Palette.blue2)),
                  ),
                ),

                //password
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: TextField(
                    controller: signinController.passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Palette.blue2,
                              width: 1.0,
                            )),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Palette.blue2)),
                    obscureText: true,
                  ),
                ),

                //pw check
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                  child: TextField(
                    controller: signinController.checkedPasswordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Palette.blue2,
                              width: 1.0,
                            )),
                        labelText: 'Repeated_pw',
                        labelStyle: TextStyle(color: Palette.blue2)),
                    obscureText: true,
                  ),
                ),

                //Success button
                GestureDetector(
                  child: Center(
                      child: Container(
                          width: _width * 0.4,
                          height: _height * 0.04,
                          decoration: BoxDecoration(
                            color: Palette.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Success",
                              style:
                                  TextStyle(fontSize: 20, color: Palette.white),
                            ),
                          ))),
                  onTap: () {
                    if (password != repeatedPassword) {
                      fToast.showToast(child: Text('비밀번호를 확인주세요'));
                    } else {
                      fToast.showToast(child: Text('회원가입에 성공했습니다.'));
                      signinController.signinUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())));
                    }
                  },
                ),
                // InkWell(
                //   child: Center(
                //       child: Container(
                //           width: _width * 0.4,
                //           height: _height * 0.04,
                //           decoration: BoxDecoration(
                //             color: Palette.blue,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //             child: Text(
                //               "Success",
                //               style:
                //                   TextStyle(fontSize: 20, color: Palette.white),
                //             ),
                //           ))),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // )
              ]
                  //회원가입하기 버튼
                  // Center(
                  //   child: ra,
                  // child: Container(
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.login_outlined,
                  //       color: Palette.white,
                  //     ),
                  //     onPressed: () async {
                  //       if (await authenticator.authentication(
                  //               userNameController.text, passwordController.text) ==
                  //           true) {
                  //         Navigator.pushNamed(context, "/home");
                  //       } else {
                  //         print("로그인 실패");
                  //       }
                  //     },
                  //   ),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       color: Palette.darkGrey),
                  // ),
                  // )

                  ),
            )
          ])),
        ),
      ),
    );
  }
}

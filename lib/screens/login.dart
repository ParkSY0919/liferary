import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/screens/signup.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/liferary_login_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    loginController;
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
              child: LoginContainer(children: [
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Palette.blue,
                  ),
                ),

                //email
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    child: TextField(
                      controller: LoginController.emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Palette.blue2,
                                width: 1.0,
                              )),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Palette.blue2)),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                    ),
                  ),
                ),

                //password
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                  child: TextField(
                    controller: LoginController.passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Palette.blue2,
                              width: 1.0,
                            )),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Palette.blue2)),
                    keyboardType: TextInputType.multiline,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 50),

                //login button
                InkWell(
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
                              "Login",
                              style:
                                  TextStyle(fontSize: 20, color: Palette.white),
                            ),
                          ))),
                  onTap: () async {
                    // loginController.loginUser();
                    if (await LoginController.loginUser()) {
                      fToast.showToast(
                          child: Text('로그인에 실패했습니다. 회원정보를 확인해주세요.'));
                      print('login error');
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomeScreen())));
                    }
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        UserCredential userCredential =
                            await signInWithGoogle();
                        // 로그인 후 처리할 코드를 작성합니다.
                      },
                      child: Text('Google 로그인'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            "Sign up here",
                            style: TextStyle(color: Palette.blue),
                          )),
                    ),
                  ],
                )
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

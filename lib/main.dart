import 'package:flutter/material.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //MARK: THEME MODE IS LIGHT? LIGHT : DARK
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Liferary',
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: HomeScreen(),
            // initialRoute: "/setting",
            // routes: {
            //   "/login": (context) => LoginScreen(),
            //   "/home": (context) => HomeScreen(),
            //   "/setting": (context) => SettingScreen()
            // }
          );
        });
  }
}

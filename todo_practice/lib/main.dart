import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '../app/view/auth/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  final FirebaseAuth auth = FirebaseAuth.instance;
}

class _MyAppState extends State<MyApp> {
  late FirebaseAuth auth;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        routes: {'/login': (context) => LoginPage()},
        home: StreamBuilder<User?>(
            //지속적으로 팔로우 해야하는 상태의 경우 stream으로 구현
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); //상태가 waiting이면 로딩 원을 보여주고
              } else {
                if (snapshot.hasData) {
                  //usercredential이 null이 아닐 경우
                  return Container(
                    color: Colors.red,
                  );
                } else {
                  return LoginPage();
                }
              }
            }));
  }
}


// AnimatedSplashScreen(
//           duration: 3000,
//           splash: 'assets/images/modulabs.png',
//           nextScreen: LoginPage(),
//         )
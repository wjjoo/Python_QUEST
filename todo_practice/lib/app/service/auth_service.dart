import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginWithEmailAndPassword(
    FirebaseAuth auth, String email, String password) async {
  try {
    //에러가 발생할 수 있는 코드
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user; //물음표가 있는 경우 null이 들어갈 수 있음
  } catch (e) {
    //e에는 발생한 에러 메시지
    print('Login Failed :$e'); // 에러가 발생했을 때 실행할 코드
  }
}

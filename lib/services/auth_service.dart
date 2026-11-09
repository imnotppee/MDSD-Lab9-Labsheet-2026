import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_message(e.code));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_message(e.code));
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), GoogleSignIn.instance.signOut()]);
    } on FirebaseAuthException catch (e) {
      throw Exception(_message(e.code));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize();
      final user = await GoogleSignIn.instance.authenticate();
      final idToken = user.authentication.idToken;
      final auth = await user.authorizationClient.authorizationForScopes(
        <String>['email', 'profile'],
      );
      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: auth?.accessToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(_message(e.code));
    } catch (_) {
      throw Exception('เข้าสู่ระบบด้วย Google ไม่สำเร็จ กรุณาลองใหม่');
    }
  }

  String _message(String code) => switch (code) {
    'email-already-in-use' => 'อีเมลนี้ถูกสมัครสมาชิกแล้ว',
    'weak-password' => 'กรุณาใช้รหัสผ่านอย่างน้อย 6 ตัวอักษร',
    'invalid-email' => 'รูปแบบอีเมลไม่ถูกต้อง',
    'invalid-credential' ||
    'wrong-password' ||
    'user-not-found' => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
    'too-many-requests' => 'ลองหลายครั้งเกินไป กรุณารอสักครู่',
    'network-request-failed' => 'ไม่สามารถเชื่อมต่อเครือข่ายได้',
    _ => 'ดำเนินการไม่สำเร็จ กรุณาลองใหม่',
  };
}

import 'package:firebase_auth/firebase_auth.dart';

class LogoutDataSource {
  final FirebaseAuth _auth;

  LogoutDataSource({FirebaseAuth? firebaseAuth})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to logout in FirebaseAuth: $e');
    }
  }
}

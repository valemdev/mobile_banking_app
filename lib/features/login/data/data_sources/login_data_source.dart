import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
/* import 'package:mobile_banking_app/core/network/api_client.dart';
 */
import 'package:mobile_banking_app/features/login/data/models/user_access_info_model.dart';

class LoginDataSource {
  final FirebaseAuth _auth;

  LoginDataSource({FirebaseAuth? firebaseAuth})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserAccessInfo> login(String email, String password) async {
    try {
      if (_auth.currentUser == null) {
        final response = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (response.user?.uid != null) {
          final token = await FirebaseAuth.instance.currentUser?.getIdToken();
          if (token != null) {
            return getUserInfo(response.user!.uid, token);
          } else {
            throw Exception('Failed to retrieve token');
          }
        }
      }
      _auth.signOut();
      throw Exception('Failed to login: User not found');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<UserAccessInfo> getUserInfo(String uid, String token) async {
    DocumentSnapshot usersCollection =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (usersCollection.exists) {
      final userData = UserAccessInfo(
        uid: uid,
        username: usersCollection.get('username'),
        email: usersCollection.get('email'),
        firstName: usersCollection.get('firstName'),
        lastName: usersCollection.get('lastName'),
        gender: usersCollection.get('gender'),
        imageUrl: usersCollection.get('imageUrl'),
        token: token,
      );
      return userData;
    } else {
      print('No se encontró el usuario con UID: $uid');
      throw Exception('No se encontró el usuario con UID: $uid');
    }
  }
}

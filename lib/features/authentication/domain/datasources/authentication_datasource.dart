import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource {
  Future<UserCredential> performLogin(String email, String password);
}

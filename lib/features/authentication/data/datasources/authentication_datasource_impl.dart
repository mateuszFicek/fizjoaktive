import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjoaktive/features/authentication/domain/datasources/authentication_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  @override
  Future<UserCredential> performLogin(String email, String password) async {
    final UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}

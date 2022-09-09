import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grosa_store/models/CurrentUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Get Firebase User
  CurrentUser? _userFromFirebase(User? user) {
    return user != null
        ? CurrentUser(
            uid: user.uid,
            photoURL: user.photoURL.toString(),
            displayName: user.displayName.toString())
        : null;
  }

  //Stream Firebase Auth
  Stream<CurrentUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //Sign In With Email
  Future<CurrentUser?> signInUsingEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential _userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(_userCredential.user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Sign Up With Email
  Future<CurrentUser?> signUpUsingEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(_userCredential.user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Google Sign In
  Future<CurrentUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return _userFromFirebase(userCredential.user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Facebook Sign In
  Future<CurrentUser?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      return _userFromFirebase(userCredential.user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Sign Out
  Future signOut() {
    return _auth.signOut();
  }
}

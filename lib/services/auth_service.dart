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

  //Google Sign In
  Future<CurrentUser?> signInWithGoogle() async {
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
  }

  //Facebook Sign In
  Future<CurrentUser?> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final UserCredential userCredential =
        await _auth.signInWithCredential(facebookAuthCredential);
    return _userFromFirebase(userCredential.user);
  }

  //Sign Out
  Future signOut() {
    return _auth.signOut();
  }
}

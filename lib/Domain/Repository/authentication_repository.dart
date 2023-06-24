import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// SIGN UP USER USING EMAIL AND PASSWORD
  Future<UserCredential> signUp(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception('sign up failed');
    }
  }

  /// SIGN IN USER WITH EMAIL AND PASSWORD
  Future<UserCredential> signIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception('Sign in failed');
    }
  }

  /// SIGN IN USER WITH GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      throw Exception('Google sign-in failed');
    }
  }

  ///SIGN IN USER WITH FACEBOOK
  Future<UserCredential> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      final accessToken = result.accessToken;
      final credential = FacebookAuthProvider.credential(accessToken!.token);
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      throw Exception('Facebook login failed');
    }
  }

  /// GET CURRENT USER ID
  String getCurrentUserId() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return '';
  }

  /// SIGN OUT THE CURRENT USER
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception();
    }
  }
}

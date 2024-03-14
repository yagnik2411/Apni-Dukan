import 'package:firebase_auth/firebase_auth.dart';

Future<String> firebaseSignUp(String emailAddress, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    // If the sign-up is successful, return
    return "Sign-up Successful";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // If the password is weak, return

      return "Password is weak";
    } else if (e.code == 'email-already-in-use') {
      // If the account already exist, return
      return "Account already exists";
    }
    // If there's an error due to Firebase Authentication, return 0
    return "Sign-up failed";
  } catch (e) {
    return "Sign-up failed";
  }
}

Future<String> firebaseSignIn(String emailAddress, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    // If the sign-in is successful, return
    return "Sign-in Successful";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // If the user is not found, return

      return "No user found";
    } else if (e.code == 'wrong-password') {
      // If the password is wrong, return

      return "Wrong password";
    }
    // If there's an error due to Firebase Authentication, return
    return "Sign-in failed";
  } catch (e) {
    return "Sign-in failed";
  }
}

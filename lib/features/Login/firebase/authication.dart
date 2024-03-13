import 'package:firebase_auth/firebase_auth.dart';


  Future<String> firebaseSignUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // If the sign-up is successful, return 1
      return "Sign-up Successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // If the password is weak, return 2
        print('The password provided is too weak.');
        return "Password is weak";
      } else if (e.code == 'email-already-in-use') {
        // If the account already exist, return 3
        print('The account already exists for that email.');
        return "Account already exists";
      }
      // If there's an error due to Firebase Authentication, return 0
      return "Sign-up failed";
    } catch (e) {
      print(e);
      return "Sign-up failed";
    }
  }


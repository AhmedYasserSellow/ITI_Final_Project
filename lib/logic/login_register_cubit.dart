import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/logic/login_register_states.dart';
import 'package:iti_final_project/views/home/home_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterStates> {
  LoginRegisterCubit() : super(LoginIntialState());
  static LoginRegisterCubit get(context) => BlocProvider.of(context);
  bool isHidden = true;

  IconData obsecureIcon = Icons.visibility;
  String? email;
  Future signUp({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Sign Up Successful, go to login page')));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign Up failed : weak passwrod')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Sign Up failed : email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sign Up failed ')));
      }
    }
  }

  Future signIn(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      prefs.setBool('isLoggedIn', true);
      if (context.mounted) {
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacementNamed(context, HomeLayout.id);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login failed')));
      }
    }
  }

  void forgotPassword({
    required BuildContext context,
    required TextEditingController emailController,
  }) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('message sent to your email')));
      }
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('enter a valid email')));
    }
  }

  void changePasswordVisibilty() {
    if (isHidden) {
      obsecureIcon = Icons.visibility;
    } else {
      obsecureIcon = Icons.visibility_off;
    }
    isHidden = !isHidden;
    emit(LoginPasswordVisibilityState());
  }
}

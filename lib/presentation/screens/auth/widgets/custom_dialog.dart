import 'package:flutter/material.dart';
import 'package:phone_app/presentation/screens/auth/login/sign_in_form.dart';

Future<Object?> customSignInDilog(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    barrierLabel: "Sign In",
    pageBuilder: (context, _, __) {
      return Center(
        child: Container(
          height: 450,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Selecting the right country code is crucial for effective communication. Enter your phone number carefully to ensure accuracy and reliability.',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ),
                    SignInForm()
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

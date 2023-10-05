import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_app/domain/auth/repo/auth_repo.dart';
import 'package:phone_app/domain/utils/util.dart';
import 'package:phone_app/presentation/screens/auth/widgets/otp_screen.dart';

@LazySingleton(as: Authentication)
class AuthImpl extends Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // signInWithPhone: Initiates phone number verification and navigation to OTP screen.
  @override
  Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically sign in the user when verification is completed.
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          // Handle verification failure and log the error.
          log(e.message.toString());
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          // Navigate to the OTP screen when the code is sent.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ),
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto-retrieval timeout if needed.
        },
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        // Show a snackbar with the error message if the context is still valid.
        showSnackBar(context: context, content: e.message!);
      }
    }
  }

  // Current user Id Store
  storeCurrentDetails(String verificationId) async {
    await storage.write(key: 'currentUserId', value: verificationId);
  }

  @override
  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      // Create PhoneAuthCredential using the verification ID and user's OTP.
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      // Sign in the user using the provided credential.
      await _auth.signInWithCredential(credential);
      storeCurrentDetails(verificationId);
    } on FirebaseAuthException catch (e) {
      // Show a snackbar with the error message if the context is still valid.
      if (context.mounted) {
        showSnackBar(context: context, content: e.message!);
      }
    }
  }
}

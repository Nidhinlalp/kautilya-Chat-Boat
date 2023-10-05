import 'package:flutter/material.dart';

abstract class Authentication {
  Future<void> signInWithPhone(BuildContext context, String phoneNumber);
  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  });
}

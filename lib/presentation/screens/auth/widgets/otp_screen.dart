import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/application/authentication/authentication_bloc.dart';
import 'package:phone_app/domain/utils/util.dart';
import 'package:phone_app/presentation/screens/home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer? _timer;
  int _start = 60;
  String getFormattedTime() {
    final seconds = _start % 60;
    final formattedSeconds = seconds.toString().padLeft(2, '0');
    return formattedSeconds;
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  Future<void> verifyOTP(BuildContext context, String userOTP) async {
    if (userOTP.isNotEmpty && userOTP.length == 6) {
      context.read<AuthenticationBloc>().add(AuthenticationEvent.verifyOTP(
            context: context,
            userOTP: userOTP,
            verificationId: widget.verificationId,
          ));
      await Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => const MobileHomeScreen(),
        ),
        (route) => false,
      );
    } else {
      showSnackBar(context: context, content: "plese check OTP");
    }
  }

  final TextEditingController otpController = TextEditingController();
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/arybatta.jpeg'),
                ),
                const Spacer(),
                const Text(
                  'RETREVIVING OTP',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(246, 66, 54, 1),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity, // Expand the container to full width
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: const Text(
                    'ENTER VERIFICATION CODE SENT TO YOUR PHONE NO IF AUTO-VERIFICATION FAILS',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: "ENTER OTP",
                    floatingLabelStyle: TextStyle(
                      color: Color.fromRGBO(246, 66, 54, 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(246, 66, 54, 1),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    verifyOTP(context, otpController.text);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Color.fromRGBO(246, 66, 54, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  getFormattedTime(),
                  style: const TextStyle(
                    color: Color.fromRGBO(246, 66, 54, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

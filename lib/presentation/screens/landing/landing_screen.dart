// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:phone_app/presentation/screens/auth/widgets/custom_dialog.dart';
import 'package:phone_app/presentation/screens/landing/widget/animaged_buton.dart';

import 'package:rive/rive.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/arybatta.jpeg'),
            ),
            const SizedBox(height: 50),
            const Text(
              "Embrace the beauty of numbers, for in them lies the key to understanding the universe.",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Poppins",
              ),
            ),
            const Spacer(),
            AnimatedBoton(
              btnAnimationController: _btnAnimationController,
              press: () {
                _btnAnimationController.isActive = true;
                Future.delayed(
                  const Duration(milliseconds: 800),
                  () {
                    customSignInDilog(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/application/authentication/authentication_bloc.dart';
import 'package:phone_app/domain/utils/util.dart';
import 'package:phone_app/presentation/screens/auth/widgets/custom_positon.dart';
import 'package:rive/rive.dart';
import 'package:country_picker/country_picker.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  StateMachineController getRiveControler(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  bool isLoading = false;
  bool isConfetti = false;
  Country? country;

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  // Send the phone number for authentication.
  Future<void> sendPhoneNumber(BuildContext context) async {
    String phoneNumber = _controller.text.trim();
    String pattern = r'^[0]?[6789]\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (phoneNumber.isEmpty) {
      showSnackBar(
        context: context,
        content: "Please enter a phoneNumber for authentication",
      );
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    } else if (phoneNumber.length < 10) {
      showSnackBar(
        context: context,
        content: "Please enteer the phoneNumber correctly",
      );
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    } else if (!regExp.hasMatch(phoneNumber)) {
      showSnackBar(
        context: context,
        content: "Please enteer the phoneNumber correctly",
      );
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    } else if (country == null) {
      showSnackBar(
        context: context,
        content: "Please select the country",
      );
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      context.read<AuthenticationBloc>().add(AuthenticationEvent.signIn(
            phoneNumber: '+${country!.phoneCode}$phoneNumber',
            contextss: context,
          ));
      check.fire();
    }
    log(phoneNumber);
  }

  void signIn() {
    setState(() {
      isLoading = true;
      isConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      log(_controller.text.length.toString());
      if (_formKey.currentState!.validate() && country != null) {
        sendPhoneNumber(context);

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isLoading = false;
          });
          confetti.fire();
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(width: 5),
                  Text(
                    "country",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: pickCountry,
                      child: Container(
                        height: 55,
                        width: 60,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.grey,
                            ),
                            Text(
                              country != null ? '+${country!.phoneCode}' : '+',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.phone_android_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveControler(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: (artboard) {
                      StateMachineController? controller =
                          StateMachineController.fromArtboard(
                              artboard, "State Machine 1");
                      artboard.addController(controller!);

                      confetti = controller.findInput<bool>("Trigger explosion")
                          as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

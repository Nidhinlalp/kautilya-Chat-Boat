import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/presentation/screens/home/widget/boat_card.dart';
import 'package:phone_app/presentation/screens/home/widget/common_intro_card.dart';
import 'package:phone_app/presentation/screens/home/widget/user_response.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xFF333333),
          automaticallyImplyLeading: false,
          title: const Text(
            'Kautilya',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.autorenew_rounded,
                color: Color.fromRGBO(246, 66, 54, 1),
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const CommonIntro();
                  } else if (index.isOdd) {
                    return const BootMessageCard();
                  } else {
                    return const UserResponse();
                  }
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: CupertinoTextField(
                  placeholder: 'Kautilya can answer anything',
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.systemGrey4,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10,
                  ),
                  suffix: const Icon(
                    Icons.send,
                    color: CupertinoColors.systemGrey,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey4,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text(
          'Are your Sure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text('Do you want to exit the app'),
        actions: [
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
    );
    return exitApp ?? false;
  }
}

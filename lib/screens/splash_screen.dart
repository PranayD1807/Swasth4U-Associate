import 'package:demo/screens/auth/login_screen.dart';
import 'package:demo/screens/auth/registration_screen.dart';
import 'package:demo/screens/need_help_screen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //  Initial Selected Value
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  final items = [
    'English',
    'Hindi',
  ];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              // elevation: ,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blue,
              ),
              value: dropdownvalue,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style:
                        const TextStyle(color: Color.fromRGBO(0, 175, 239, 1)),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                "assets/login_image.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: deviceSize.width * 0.6,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: deviceSize.width * 0.6,
                    ),
                    child: const FittedBox(
                      child: Text(
                        "Swasth 4U\nHealth & Wellness Card",
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(26, 84, 153, 1)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.65,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(double.maxFinite, 30),
                        // tapTargetSize: MaterialTapTargetSize.padded,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Become An Associate",
                      style: TextStyle(color: Color.fromRGBO(0, 175, 239, 1)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NeedHelpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Need Help?",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 101, 101, 1),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

import 'package:demo/screens/home/appointment_booking_screen.dart';
import 'package:demo/screens/home/associate_screen.dart';
import 'package:demo/screens/home/e_kyc_screen.dart';
import 'package:demo/screens/home/medical_camp_screen.dart';
import 'package:demo/screens/home/my_profile_screen.dart';
import 'package:demo/screens/home/patient_history_screen.dart';
import 'package:demo/screens/home/verify_card.dart';
import 'package:demo/utils/custom_size.dart';

import 'package:demo/widgets/card.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/top_welcome_nav.dart';
import 'package:flutter/material.dart';

import 'package:marquee/marquee.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CustomSize customSize = CustomSize();

    List<Map> tools = [
      {
        "path": "assets/my_profile_main.png",
        "text": "My Profile",
        "page": const MyProfileScreen()
      },
      {
        "path": "assets/associate.png",
        "text": "Associate",
        "page": const AssociateScreen()
      },
      {
        "path": "assets/verify_card.png",
        "text": "Verify Card",
        "page": const VerifyCardScreen()
      },
      {
        "path": "assets/patient_history.png",
        "text": "Patient's History",
        "page": PatientHistoryScreen()
      },
      {
        "path": "assets/medical_camps.png",
        "text": "Medical Camps",
        "page": const MedicalCampScreen()
      },
      {
        "path": "assets/appointment.png",
        "text": "Apointment & Booking",
        "page": const AppointmentBookingScreen()
      },
      {
        "path": "assets/kyc.png",
        "text": "E-KYC",
        "page": const EKYCScreen(),
      },
    ];
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const MyTopNav(),
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                constraints: BoxConstraints(
                    maxHeight: customSize.getHeightForHomePage(context),
                    minHeight: 200),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      MyCard(
                        cardWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      Container(
                        // height: 200,
                        constraints: const BoxConstraints(),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        width: double.maxFinite,
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: tools.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  if (tools[i]["page"] != null) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => tools[i]["page"],
                                      ),
                                    );
                                  }
                                },
                                child: CustomIconButtons(
                                  path: tools[i]["path"],
                                  text: tools[i]["text"],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(208, 255, 227, 1)),
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 25,
                child: Marquee(
                  text:
                      "Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

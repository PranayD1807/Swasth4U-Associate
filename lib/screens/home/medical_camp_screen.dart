import 'package:demo/screens/home/medical_camp_history_screen.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/medical_camp_widget.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/pop_up_medical_camp.dart';
import 'package:flutter/material.dart';

class MedicalCampScreen extends StatefulWidget {
  const MedicalCampScreen({Key? key}) : super(key: key);

  @override
  State<MedicalCampScreen> createState() => _MedicalCampScreenState();
}

class _MedicalCampScreenState extends State<MedicalCampScreen> {
  List<MedicalCampWidget> camps = [
    const MedicalCampWidget(),
    const MedicalCampWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(height: 35, child: Image.asset("assets/logo.png"))),
        // centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          const PageHeading(
            text: "Medical Camp",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              barrierColor: Colors.black12
                                  .withOpacity(0.6), // Background color
                              barrierDismissible: true,
                              barrierLabel: 'Dialog',
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) {
                                return const PopUpMedicalCampWidget();
                              },
                            );
                          },
                          child: const CustomIconButtons(
                              path: "assets/medical_camps.png",
                              text: "Provide Medical\nCamps"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MedicalCampsHistoryScreen(),
                              ),
                            );
                          },
                          child: const CustomIconButtons(
                            path: "assets/medical_camps.png",
                            text: "View History",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: camps,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

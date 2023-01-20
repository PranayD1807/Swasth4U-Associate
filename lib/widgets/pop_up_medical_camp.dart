import 'package:demo/widgets/pop_up_medical_camp_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PopUpMedicalCampWidget extends StatefulWidget {
  const PopUpMedicalCampWidget({Key? key}) : super(key: key);

  @override
  State<PopUpMedicalCampWidget> createState() => _PopUpMedicalCampWidgetState();
}

class _PopUpMedicalCampWidgetState extends State<PopUpMedicalCampWidget> {
  final TextEditingController dateCtrl = TextEditingController();

  InputDecoration decoration(String hintText, Widget? suffix) {
    return InputDecoration(
      constraints: const BoxConstraints(),
      isDense: true,
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      // suffix: suffix,
      suffixIcon: suffix,
      hintStyle: const TextStyle(color: Color.fromRGBO(196, 196, 196, 1)),
      labelStyle: const TextStyle(
        color: Color.fromRGBO(79, 124, 177, 1),
      ),
      floatingLabelStyle:
          const TextStyle(color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
      hintText: hintText,
    );
  }

  double areaVal = 30.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(236, 247, 255, 1)),
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: const FittedBox(
                      child: Text(
                        "Provide Medical\nCamp Date & Area",
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(54, 105, 166, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color.fromRGBO(54, 105, 166, 1),
                    thickness: 2,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Date",
                      textScaleFactor: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Date
                  TextFormField(
                    controller: dateCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Date";
                      }
                      return null;
                    },
                    readOnly: true,
                    keyboardType: TextInputType.datetime,
                    decoration: decoration(
                      "DD/MM/YYYY",
                      IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate:
                                DateTime.now().add(const Duration(seconds: 5)),
                          );
                          if (date != null) {
                            dateCtrl.text =
                                DateFormat("dd/MM/yyyy").format(date);
                          }
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/calender.png"),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        iconSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Area
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Area",
                      textScaleFactor: 1.2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            activeColor: const Color.fromRGBO(0, 106, 183, 1),
                            max: 100,
                            min: 0,
                            value: areaVal,
                            onChanged: (newVal) {
                              setState(() {
                                areaVal = newVal;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "${areaVal.toInt()} KM",
                          textScaleFactor: 0.8,
                        ),
                      )
                    ],
                  ),
                  // Continue Button
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.5, 5),
                        elevation: 0,
                        backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black12
                              .withOpacity(0.6), // Background color
                          barrierDismissible: true,
                          barrierLabel: 'Dialog',
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) {
                            return const PopUpStatusMedicalCamp();
                          },
                        );
                      },
                      child: const Text(
                        "Continue",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

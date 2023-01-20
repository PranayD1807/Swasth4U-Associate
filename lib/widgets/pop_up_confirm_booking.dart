import 'package:flutter/material.dart';

class PopUpConfirmBookingWidget extends StatefulWidget {
  const PopUpConfirmBookingWidget({Key? key}) : super(key: key);

  @override
  State<PopUpConfirmBookingWidget> createState() =>
      _PopUpConfirmBookingWidgetState();
}

class _PopUpConfirmBookingWidgetState extends State<PopUpConfirmBookingWidget> {
  final TextEditingController serialNoCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();

  InputDecoration decoration(String hintText, Widget? suffix) {
    return InputDecoration(
      constraints: const BoxConstraints(),
      // isDense: true,

      fillColor: Colors.transparent,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 1, color: Color.fromRGBO(0, 106, 183, 1)),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 1, color: Color.fromRGBO(0, 106, 183, 1)),
        borderRadius: BorderRadius.circular(5),
      ),
      suffixIcon: suffix,

      hintStyle: const TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
      labelStyle: const TextStyle(
        color: Color.fromRGBO(79, 124, 177, 1),
      ),
      floatingLabelStyle:
          const TextStyle(color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
      hintText: hintText,
    );
  }

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
                        "Confirm Booking",
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
                  // Date
                  TextFormField(
                    controller: serialNoCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Serial Number";
                      }
                      return null;
                    },
                    // readOnly: true,
                    keyboardType: TextInputType.datetime,
                    decoration: decoration("Enter Serial Number", null),
                  ),
                  const SizedBox(height: 10),
                  // Area
                  TextFormField(
                    controller: timeCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Select Time";
                      }
                      return null;
                    },
                    readOnly: true,
                    keyboardType: TextInputType.datetime,
                    decoration: decoration(
                      "Select Time",
                      IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            // ignore: use_build_context_synchronously
                            timeCtrl.text = time.format(context);
                          }
                        },
                        icon: const Icon(
                          Icons.access_time_filled,
                          // size: 15,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                        padding: EdgeInsets.zero,
                        // iconSize: 20,
                      ),
                    ),
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
                        // showGeneralDialog(
                        //   context: context,
                        //   barrierColor: Color.fromRGBO(0, 106, 183, 1)12
                        //       .withOpacity(0.6), // Background color
                        //   barrierDismissible: true,
                        //   barrierLabel: 'Dialog',
                        //   transitionDuration: const Duration(milliseconds: 400),
                        //   pageBuilder: (_, __, ___) {
                        //     return const Popups;
                        //   },
                        // );
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Confirm",
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

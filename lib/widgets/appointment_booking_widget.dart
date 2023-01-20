import 'package:demo/widgets/pop_up_confirm_booking.dart';
import 'package:demo/widgets/popup_cancel_reason.dart';
import 'package:flutter/material.dart';

class AppointmentBookingTile extends StatelessWidget {
  const AppointmentBookingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(236, 247, 255, 1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color.fromRGBO(17, 136, 222, 1))),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: const FittedBox(
                      child: Text(
                        "1234567891213548",
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: const FittedBox(
                      child: Text(
                        "Card Holder Name",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: const FittedBox(
                      child: Text(
                        "Father's Name",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const Card(
                elevation: 5,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/card.png"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: const FittedBox(
                  child: Text(
                    "S.No. 0987",
                    textScaleFactor: 0.9,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 106, 183, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: const FittedBox(
                  child: Text(
                    "Valid - 365 Days",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 106, 183, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              child: const FittedBox(
                child: Text(
                  "Date - 12-06-2022",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 106, 183, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.35, 5),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierColor:
                        Colors.black12.withOpacity(0.6), // Background color
                    barrierDismissible: true,
                    barrierLabel: 'Dialog',
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return const PopUpConfirmBookingWidget();
                    },
                  );
                },
                child: const Text(
                  "Confirm",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.35, 5),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierColor:
                        Colors.black12.withOpacity(0.6), // Background color
                    barrierDismissible: true,
                    barrierLabel: 'Dialog',
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return const CancelReasonPopUp();
                    },
                  );
                },
                child: const Text(
                  "Cancel",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.35, 5),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(14, 203, 102, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                onPressed: () {},
                child: const Text(
                  "Present",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.35, 5),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(234, 30, 37, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                onPressed: () {},
                child: const Text(
                  "Not Present",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:demo/utils/custom_size.dart';
import 'package:demo/widgets/appointment_booking_history_tile.dart';
import 'package:demo/widgets/date_filter.dart';

import 'package:flutter/material.dart';

import 'package:demo/widgets/page_heading.dart';

// ignore: must_be_immutable
class AppointmentBookingHistoryScreen extends StatefulWidget {
  const AppointmentBookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentBookingHistoryScreen> createState() =>
      _AppointmentBookingHistoryScreenState();
}

class _AppointmentBookingHistoryScreenState
    extends State<AppointmentBookingHistoryScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CustomSize customSize = CustomSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: const [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
            ),
            SizedBox(width: 10),
            Text(
              "Present",
              style: TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
            ),
            SizedBox(width: 15),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
            ),
            SizedBox(width: 10),
            Text(
              "Absent",
              style: TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6), // Background color
            barrierDismissible: true,
            barrierLabel: 'Dialog',
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return const DateFilterScreen();
            },
          );
        },
        backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
        child: const ImageIcon(AssetImage("assets/filter.png")),
      ),
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
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              const PageHeading(
                text: "Appointment & Booking History",
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Material(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: searchCtrl,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter text to search";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        // isDense: true,
                        filled: true,
                        focusColor: const Color.fromRGBO(234, 247, 255, 1),
                        hoverColor: const Color.fromRGBO(234, 247, 255, 1),
                        fillColor: const Color.fromRGBO(234, 247, 255, 1),
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage("assets/search.png"),
                              color: Color.fromRGBO(0, 175, 239, 1),
                            ),
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(79, 124, 177, 1),
                        ),
                        floatingLabelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        hintText: "Search...",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 175, 239, 1),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 175, 239, 1),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  // maxHeight: MediaQuery.of(context).size.height * 0.72,
                  maxHeight:
                      customSize.getHeightForScreenWithoutBottomNav(context) -
                          (75 + 40), // 75 is the height of search bar
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      AppointmentBookingHistoryTile(
                    isPresent: index.isEven,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

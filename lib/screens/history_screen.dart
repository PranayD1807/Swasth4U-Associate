import 'package:demo/utils/custom_size.dart';
import 'package:demo/widgets/appointment_booking_history_tile.dart';

import 'package:flutter/material.dart';

import 'package:demo/widgets/page_heading.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CustomSize customSize = CustomSize();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          const PageHeading(
            text: "Today's Booking History",
          ),
          Container(
            constraints: BoxConstraints(
              // maxHeight: MediaQuery.of(context).size.height * 0.72,
              maxHeight: customSize.getHeightForHomePage(context) - 40,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => AppointmentBookingHistoryTile(
                isPresent: index.isEven,
              ),
            ),
          )
        ],
      ),
    );
  }
}

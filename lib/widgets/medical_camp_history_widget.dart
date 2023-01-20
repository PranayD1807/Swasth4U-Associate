import 'package:demo/screens/home/medical_camp_patient_details_screen.dart';
import 'package:flutter/material.dart';

class MedicalCampHistoryTile extends StatelessWidget {
  const MedicalCampHistoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(236, 247, 255, 1),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(17, 136, 222, 1)),
          ),
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Free Medical Camp - General Physician",
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 106, 183, 1),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dr. XYZ",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "MBBD (PMCH)",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Date : 20-04-2022",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Time : 10AM to 6PM",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.14,
                    backgroundImage: const AssetImage("assets/card.png"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Venue : XXXXXXXXXXXXXXXXXX",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "S.No. 0978",
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 106, 183, 1),
                    ),
                  ),
                  Text(
                    "Total Visits - 200",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 106, 183, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MedicalCampPatientDetailsScreen()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: const Size(double.maxFinite, 30),
              // tapTargetSize: MaterialTapTargetSize.padded,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            ),
            child: const FittedBox(
              child: Text(
                "View Details",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

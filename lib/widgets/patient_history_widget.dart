import 'package:flutter/material.dart';

class PatientHistoryTile extends StatelessWidget {
  const PatientHistoryTile({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}

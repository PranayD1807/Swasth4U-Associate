import 'package:demo/widgets/doc_detail_profile.dart';
import 'package:demo/widgets/map.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final formKey = GlobalKey<FormState>();

  // decor
  InputDecoration inputDecoration = InputDecoration(
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
  );
  // controllers
  final TextEditingController categoryOfAssociateCtrl = TextEditingController();
  final TextEditingController firmNameCtrl = TextEditingController();
  final TextEditingController ownerNameCtrl = TextEditingController();
  final TextEditingController licenseNoCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController districtCtrl = TextEditingController();
  final TextEditingController blockCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController selfphoneNumberCtrl = TextEditingController();

  final TextEditingController emailCtrl = TextEditingController();
  //
  final TextEditingController feesDiscountCtrl = TextEditingController();
  final TextEditingController testDiscountCtrl = TextEditingController();
  final TextEditingController medicineDiscountCtrl = TextEditingController();
  final TextEditingController idpDiscountCtrl = TextEditingController();
  final TextEditingController opdDiscountCtrl = TextEditingController();
  final TextEditingController otherDiscountCtrl = TextEditingController();
  final TextEditingController discountTimeCtrl = TextEditingController();
  final TextEditingController freeCampsMonthCtrl = TextEditingController();
  //
  final TextEditingController benificiaryCtrl = TextEditingController();
  final TextEditingController bankNameCtrl = TextEditingController();
  final TextEditingController acNoCtrl = TextEditingController();
  final TextEditingController ifscCodeCtrl = TextEditingController();
  final TextEditingController branchCtrl = TextEditingController();

  //
  final TextEditingController searchCtrl = TextEditingController();

  //
  String appointmentType = "Online";
  String consultationPaymentMethod = "Online";

  //
  // List<TextEditingController> subCategoriesCtrl = [];
  List<Widget> subCategoryWidgets = [];
  List<String?> selectedCategories = [];
  List<String> subcategoryOptions = [
    'category',
    'Skilled Nursing Facility',
    'Other',
  ];
  String? state;
  List<String> states = [
    'State 1',
    'State 2',
    'State 3',
    'Other',
  ];
  String? district;
  List<String> districts = [
    'District 1',
    'District 2',
    'District 3',
    'Other',
  ];
  String? block;
  List<String> blocks = [
    'Block 1',
    'Block 2',
    'Block 3',
    'Other',
  ];
  //
  List<TextEditingController> facilityCtrl = [];
  List<Widget> facilityTextFields = [];

  List<TextEditingController> specializeServiceCtrl = [];
  List<Widget> specializeServiceTextFields = [];

  // for doctor details
  List<Map<String, TextEditingController>> doctorDetailCtrlers = [];
  List<Widget> doctorDetailWidgets = [];

  @override
  void initState() {
    super.initState();
    categoryOfAssociateCtrl.text = "Nursing Home";
    firmNameCtrl.text = "Janta Nursing Home";
    ownerNameCtrl.text = "Dr. Kamal Kishor Prasad";
    firmNameCtrl.text = "Janta Nursing Home";
    licenseNoCtrl.text = "1234/01";
    addressCtrl.text = "Main Road, City, In front of Mall.";
    stateCtrl.text = "Bihar";
    districtCtrl.text = "Patna";
    blockCtrl.text = "Digha";
    pincodeCtrl.text = "800004";
    phoneNumberCtrl.text = "9784515265";
    selfphoneNumberCtrl.text = "9845613456";

    emailCtrl.text = "sample@sample.com";
    feesDiscountCtrl.text = "10";
    testDiscountCtrl.text = "20";
    medicineDiscountCtrl.text = "20";
    idpDiscountCtrl.text = "50";
    opdDiscountCtrl.text = "60";
    otherDiscountCtrl.text = "15";
    discountTimeCtrl.text = "5";
    freeCampsMonthCtrl.text = "7";
    //
    benificiaryCtrl.text = "Benificiary Name";
    bankNameCtrl.text = "Bank Name";
    acNoCtrl.text = "09876541324568";
    ifscCodeCtrl.text = "ASDFG1234";
    branchCtrl.text = "Patna";
    //
    state = "State 1";
    district = "District 1";
    block = "Block 1";

    // sub categories
    // subCategoriesCtrl
    //     .add(TextEditingController(text: "Skilled Nursing Factory"));
    // subCategoriesCtrl[0].text = "Skilled Nursing Factory";
    selectedCategories.add("Skilled Nursing Facility");
    subCategoryWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: DropdownButtonFormField2(
          isExpanded: true,
          dropdownElevation: 3,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 20,
          buttonHeight: 20,
          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          validator: (value) {
            if (value == null) {
              return 'Please select Category.';
            }
            return null;
          },
          onChanged: (value) {
            selectedCategories[selectedCategories.length - 1] =
                value.toString();
          },
          onSaved: (value) {
            selectedCategories[0] = value.toString();
          },
          value: selectedCategories[0],
          decoration: inputDecoration,
          items: subcategoryOptions
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
    // facility
    facilityCtrl.add(TextEditingController(text: "ECG"));
    // facilityCtrl[0].text = "ECG";

    facilityTextFields.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          controller: facilityCtrl[0],
          decoration: inputDecoration,
        ),
      ),
    );
    // facility
    specializeServiceCtrl.add(TextEditingController(text: "Cesarean"));
    // specializeServiceCtrl[0].text = "Cesarean";

    specializeServiceTextFields.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          controller: specializeServiceCtrl[0],
          decoration: inputDecoration,
        ),
      ),
    );
    // Doctor Ctrls
    doctorDetailCtrlers.add({
      "docNameCtrl": TextEditingController(text: "DR. R. K. Singh"),
      "designation": TextEditingController(text: "MBBS, MD"),
      "department": TextEditingController(text: "Cardiology"),
    });
    doctorDetailWidgets.add(
      DocDetailsProfileWidget(
        nameCtrl: doctorDetailCtrlers[0]["docNameCtrl"]!,
        designationCtrl: doctorDetailCtrlers[0]["designation"]!,
        departmentCtrl: doctorDetailCtrlers[0]["department"]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void addSubCategory() {
      setState(() {
        selectedCategories.add(null);
        subCategoryWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: DropdownButtonFormField2(
              isExpanded: true,
              dropdownElevation: 3,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 20,
              buttonHeight: 20,
              buttonPadding: const EdgeInsets.only(left: 5, right: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please select Category.';
                }
                return null;
              },
              value: selectedCategories[selectedCategories.length - 1],
              onChanged: (value) {
                selectedCategories[selectedCategories.length - 1] =
                    value.toString();
              },
              onSaved: (value) {
                selectedCategories[selectedCategories.length - 1] =
                    value.toString();
              },
              decoration: inputDecoration,
              items: subcategoryOptions
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      });
    }

    void addDoctorDetailWidget() {
      setState(() {
        doctorDetailCtrlers.add({
          "docNameCtrl": TextEditingController(),
          "designation": TextEditingController(),
          "department": TextEditingController(),
        });
        doctorDetailWidgets.add(
          DocDetailsProfileWidget(
            nameCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["docNameCtrl"]!,
            designationCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["designation"]!,
            departmentCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["department"]!,
          ),
        );
      });
    }

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
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const PageHeading(
              text: "My Profile",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // height: 500,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(
                      top: 5, right: 15, left: 15, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(17, 136, 222, 1),
                    ),
                    color: const Color.fromRGBO(236, 247, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: const Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.height * 0.17,
                              child: Image.asset(
                                "assets/user_person.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: -15,
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: ClipPath(
                                  clipper: StarClipper(10),
                                  child: Container(
                                    height: 150,
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      // child: Icon(
                                      //   Icons.check,
                                      //   size: 12,
                                      //   color: Colors.white,
                                      // ),
                                      child: ImageIcon(
                                        AssetImage("assets/check.png"),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const _Heading(text: "Category of Associate"),
                        TextFormField(
                          controller: categoryOfAssociateCtrl,
                          decoration: inputDecoration,
                        ),
                        const _Heading(text: "SubCategory"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: subCategoryWidgets,
                              ),
                            ),
                            IconButton(
                              onPressed: () => addSubCategory(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                size: 30,
                                color: Color.fromRGBO(24, 84, 153, 1),
                              ),
                            ),
                          ],
                        ),
                        const _HeadingImp(text: "Firm Name"),
                        TextFormField(
                          controller: firmNameCtrl,
                          decoration: inputDecoration,
                        ),
                        const _HeadingImp(text: "Owner Name"),
                        TextFormField(
                          controller: ownerNameCtrl,
                          decoration: inputDecoration,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: doctorDetailWidgets,
                        ),
                        IconButton(
                          onPressed: () => addDoctorDetailWidget(),
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 40,
                            color: Color.fromRGBO(26, 84, 153, 1),
                          ),
                        ),
                        const _Heading(text: "Facility"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: facilityTextFields,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  facilityCtrl.add(TextEditingController());
                                  facilityTextFields.add(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: TextFormField(
                                        controller: facilityCtrl[
                                            facilityCtrl.length - 1],
                                        decoration: inputDecoration,
                                      ),
                                    ),
                                  );
                                });
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                size: 30,
                                color: Color.fromRGBO(24, 84, 153, 1),
                              ),
                            ),
                          ],
                        ),
                        const _HeadingImp(text: "Specialize of Services"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: specializeServiceTextFields,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  specializeServiceCtrl
                                      .add(TextEditingController());
                                  specializeServiceTextFields.add(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: TextFormField(
                                        controller: specializeServiceCtrl[
                                            specializeServiceCtrl.length - 1],
                                        decoration: inputDecoration,
                                      ),
                                    ),
                                  );
                                });
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                size: 30,
                                color: Color.fromRGBO(24, 84, 153, 1),
                              ),
                            ),
                          ],
                        ),
                        const _Heading(text: "License No / Registration No"),
                        TextFormField(
                          controller: licenseNoCtrl,
                          decoration: inputDecoration,
                          keyboardType: TextInputType.number,
                        ),
                        const _Heading(text: "Address"),
                        TextFormField(
                          controller: addressCtrl,
                          maxLines: 3,
                          decoration: inputDecoration,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Heading(text: "State"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownElevation: 3,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    iconSize: 20,
                                    buttonHeight: 20,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return 'Please select State.';
                                      }
                                      return null;
                                    },
                                    value: state,
                                    onChanged: (value) {
                                      state = value.toString();
                                    },
                                    onSaved: (value) {
                                      state = value.toString();
                                    },
                                    decoration: inputDecoration,
                                    items: states
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Heading(text: "District"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownElevation: 3,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    iconSize: 20,
                                    buttonHeight: 20,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return 'Please select District.';
                                      }
                                      return null;
                                    },
                                    value: district,
                                    onChanged: (value) {
                                      district = value.toString();
                                    },
                                    onSaved: (value) {
                                      district = value.toString();
                                    },
                                    decoration: inputDecoration,
                                    items: districts
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Heading(text: "Block"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownElevation: 3,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    iconSize: 20,
                                    buttonHeight: 20,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return 'Please select Block.';
                                      }
                                      return null;
                                    },
                                    value: block,
                                    onChanged: (value) {
                                      block = value.toString();
                                    },
                                    onSaved: (value) {
                                      block = value.toString();
                                    },
                                    decoration: inputDecoration,
                                    items: blocks
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Heading(text: "Pin Code"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: pincodeCtrl,
                                    decoration: inputDecoration,
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return 'Please select Pin Code.';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const _Heading(text: "Associate Phone Number"),
                        TextFormField(
                          controller: phoneNumberCtrl,
                          decoration: inputDecoration,
                          keyboardType: TextInputType.number,
                        ),
                        const _Heading(text: "Self Phone Number"),
                        TextFormField(
                          controller: selfphoneNumberCtrl,
                          decoration: inputDecoration,
                          keyboardType: TextInputType.number,
                        ),
                        const _Heading(text: "Email ID"),
                        TextFormField(
                          controller: emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          decoration: inputDecoration,
                        ),
                        const SizedBox(height: 15),
                        const _HeadingImp(
                            text: "Discount given to \"Swasth4u Card Holder\""),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "Fees"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: feesDiscountCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "Test"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: testDiscountCtrl,
                                keyboardType: TextInputType.number,
                                decoration: inputDecoration,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "Medicine"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: medicineDiscountCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "IDP"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: idpDiscountCtrl,
                                keyboardType: TextInputType.number,
                                decoration: inputDecoration,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "OPD"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: opdDiscountCtrl,
                                keyboardType: TextInputType.number,
                                decoration: inputDecoration,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _HeadingImp(text: "Others"),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: otherDiscountCtrl,
                                keyboardType: TextInputType.number,
                                decoration: inputDecoration,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const _Heading(text: "%")
                          ],
                        ),
                        const SizedBox(height: 15),
                        const _HeadingImp(
                            text:
                                "Cardholders with “Swasth 4 U”  agreed discount time from today : Up to"),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                controller: discountTimeCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Year",
                              textScaleFactor: 1.2,
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const _HeadingImp(
                            text:
                                "Free medical camps will be given by us in a month"),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                controller: freeCampsMonthCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Months",
                              textScaleFactor: 1.2,
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const _HeadingImp(text: "Appointment Type"),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                children: <Widget>[
                                  const Text(
                                    "Offline",
                                    textScaleFactor: 1.2,
                                  ),
                                  Radio(
                                    value: "Offline",
                                    groupValue: appointmentType,
                                    onChanged: <String>(value) {
                                      setState(() {
                                        appointmentType = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                children: <Widget>[
                                  const Text(
                                    "Online",
                                    textScaleFactor: 1.2,
                                  ),
                                  Radio(
                                    value: "Online",
                                    groupValue: appointmentType,
                                    onChanged: <String>(value) {
                                      setState(() {
                                        appointmentType = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (appointmentType == "Online")
                          const _Heading(text: "Consultation Payment Method"),
                        if (appointmentType == "Online")
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: <Widget>[
                                    const Text(
                                      "Offline",
                                      textScaleFactor: 1.2,
                                    ),
                                    Radio(
                                      value: "Offline",
                                      groupValue: consultationPaymentMethod,
                                      onChanged: <String>(value) {
                                        setState(() {
                                          consultationPaymentMethod = value!;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: <Widget>[
                                    const Text(
                                      "Online",
                                      textScaleFactor: 1.2,
                                    ),
                                    Radio(
                                      value: "Online",
                                      groupValue: consultationPaymentMethod,
                                      onChanged: <String>(value) {
                                        setState(() {
                                          consultationPaymentMethod = value!;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        if (appointmentType == "Online" &&
                            consultationPaymentMethod == "Online")
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 15),
                              const _Heading(text: "Benificiary Name"),
                              TextFormField(
                                controller: benificiaryCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Bank Name"),
                              TextFormField(
                                controller: bankNameCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "A/C No."),
                              TextFormField(
                                controller: acNoCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "IFSC Name"),
                              TextFormField(
                                controller: ifscCodeCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Branch"),
                              TextFormField(
                                controller: branchCtrl,
                                decoration: inputDecoration,
                              ),
                            ],
                          ),
                        const SizedBox(height: 30),
                        Card(
                            elevation: 3, child: MyMap(searchCtrl: searchCtrl)),
                        const SizedBox(height: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 5),
                            elevation: 0,
                            backgroundColor:
                                const Color.fromRGBO(0, 175, 239, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Save",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: Text(
            text,
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}

class _HeadingImp extends StatelessWidget {
  const _HeadingImp({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Text(
                text,
                textScaleFactor: 1.2,
              ),
            ),
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
              textScaleFactor: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}

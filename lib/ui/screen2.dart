import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen3.dart';

class AddressInfoPage extends StatefulWidget {
  final String lessons;
  final String courseLength;
  final String lessonLength;
  final String costPerLesson;
  final String roadTestPkg;
  final String totalAmount;
  final String administrativeExpense;
  final String courseRate;
  final String payment11;
  final String date11;
  final String payment12;
  final String date12;
  final String payment21;
  final String date21;
  final String payment22;
  final String date22;
  final String payment31;
  final String date31;
  final String payment32;
  final String date32;
  final String payment41;
  final String date41;
  final String payment42;
  final String date42;
  final String lessons1;
  final String courseLength1;
  final String lessonLength1;
  final String lessonCost1;
  final String lessons2;
  final String courseLength2;
  final String lessonLength2;
  final String lessonCost2;
  final String courseRate1;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String makeupAssignment;
  final String classroomInstructionStartDate;
  final String parentName;
  final Uint8List? parentInitials;
  final Uint8List? parentSignature;
  final DateTime parentSigningDate;
  final Uint8List? representativeInitials;
  final Uint8List? representativeSignature;
  final DateTime selectedDate;
  final String classroomInstructionEndDate;
  final String makeupAssignmentDate;
  final Uint8List? initials;
  final Uint8List? signature;

  final int noShowFeeAmount;
  final int noShowFeeNoticePeriod;
  final int latePolicyWaitingTime;
  final int propertyDamageFeeAmount;
  final int gasPriceLimit;
  final int fuelSurchargeAmount;







  final String firstName;
  final String middleName;
  final String lastName;
  final String? dateOfBirth;
  final String? gender;


  const AddressInfoPage({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.parentInitials,
    required this.parentSignature,
    required this.parentSigningDate,
    required this.representativeInitials,
    required this.representativeSignature,
    required this.selectedDate,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
    required this.makeupAssignmentDate,
    required this.initials,
    required this.signature, required this.representativeName, required this.parentName, required this.lessons, required this.courseLength, required this.lessonLength, required this.costPerLesson, required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense, required this.courseRate, required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate1, this.repInitials, this.repSignature, required this.classroomInstructionStartTime, required this.classroomInstructionEndTime, required this.makeupAssignment, required this.noShowFeeAmount, required this.noShowFeeNoticePeriod, required this.latePolicyWaitingTime, required this.propertyDamageFeeAmount, required this.gasPriceLimit, required this.fuelSurchargeAmount,

  });

  @override
  _AddressInfoPageState createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  final areaCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Address Information'),
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        items: ['Area Code 1', 'Area Code 2', 'Area Code 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            areaCodeController.text = value ?? '';
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: streetAddressController,
                  decoration: InputDecoration(
                    labelText: 'Street address of Student',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: stateController,
                  decoration: InputDecoration(
                    labelText: 'State',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: zipCodeController,
                  decoration: InputDecoration(
                    labelText: 'ZIP code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Add space here instead of using Spacer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Prev'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final phoneNumber =
                            areaCodeController.text + phoneNumberController.text;
                        final streetAddress = streetAddressController.text;
                        final city = cityController.text;
                        final state = stateController.text;
                        final zipCode = zipCodeController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactInfoPage(
                              lessons: widget.lessons,
                              courseLength: widget.courseLength,
                              lessonLength: widget.lessonLength,
                              costPerLesson: widget.costPerLesson,
                              roadTestPkg: widget.roadTestPkg,
                              totalAmount: widget.totalAmount,
                              administrativeExpense: widget.administrativeExpense,
                              courseRate: widget.courseRate,
                              payment11: widget.payment11,
                              date11: widget.date11,
                              payment12: widget.payment12,
                              date12: widget.date12,
                              payment21: widget.payment21,
                              date21: widget.date21,
                              payment22: widget.payment22,
                              date22: widget.date22,
                              payment31: widget.payment31,
                              date31: widget.date31,
                              payment32: widget.payment32,
                              date32: widget.date32,
                              payment41: widget.payment41,
                              date41: widget.date41,
                              payment42: widget.payment42,
                              date42: widget.date42,
                              lessons1: widget.lessons1,
                              courseLength1: widget.courseLength1,
                              lessonLength1: widget.lessonLength1,
                              lessonCost1: widget.lessonCost1,
                              lessons2: widget.lessons2,
                              courseLength2: widget.courseLength2,
                              lessonLength2: widget.lessonLength2,
                              lessonCost2: widget.lessonCost2,
                              courseRate1: widget.courseRate1,
                              representativeName: widget.representativeName,
                              repInitials: widget.repInitials,
                              repSignature: widget.repSignature,
                              classroomInstructionStartTime: widget.classroomInstructionStartTime,
                              classroomInstructionEndTime: widget.classroomInstructionEndTime,
                              makeupAssignment: widget.makeupAssignment,
                              classroomInstructionStartDate: widget.classroomInstructionStartDate,
                              parentName: widget.parentName,
                              parentInitials: widget.parentInitials,
                              parentSignature: widget.parentSignature,
                              parentSigningDate: widget.parentSigningDate,
                              representativeInitials: widget.representativeInitials,
                              representativeSignature: widget.representativeSignature,
                              selectedDate: widget.selectedDate,
                              classroomInstructionEndDate: widget.classroomInstructionEndDate,
                              makeupAssignmentDate: widget.makeupAssignmentDate,
                              initials: widget.initials,
                              signature: widget.signature,
                              noShowFeeAmount:  60,
                              noShowFeeNoticePeriod: 24,
                              latePolicyWaitingTime: 5,
                              propertyDamageFeeAmount: 50,
                              gasPriceLimit: 0, fuelSurchargeAmount: 0,

                              firstName: widget.firstName,
                              middleName: widget.middleName,
                              lastName: widget.lastName,
                              dateOfBirth: widget.selectedDate,
                              gender: widget.gender,





                              phoneNumber: phoneNumber,
                              streetAddress: streetAddress,
                              city: city,
                              state: state,
                              zipCode: zipCode,
                            ),
                          ),
                        );
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
































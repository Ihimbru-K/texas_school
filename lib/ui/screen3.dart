
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/sub2.dart';
import 'package:form/ui/submited_data.dart';

class ContactInfoPage extends StatefulWidget {
  final dynamic lessons;
  final dynamic courseLength;
  final dynamic lessonLength;
  final dynamic costPerLesson;
  final dynamic roadTestPkg;
  final dynamic totalAmount;
  final dynamic administrativeExpense;
  final dynamic courseRate;
  final dynamic payment11;
  final dynamic date11;
  final dynamic payment12;
  final dynamic date12;
  final dynamic payment21;
  final dynamic date21;
  final dynamic payment22;
  final dynamic date22;
  final dynamic payment31;
  final dynamic date31;
  final dynamic payment32;
  final dynamic date32;
  final dynamic payment41;
  final dynamic date41;
  final dynamic payment42;
  final dynamic date42;
  final dynamic lessons1;
  final dynamic courseLength1;
  final dynamic lessonLength1;
  final dynamic lessonCost1;
  final dynamic lessons2;
  final dynamic courseLength2;
  final dynamic lessonLength2;
  final dynamic lessonCost2;
  final dynamic courseRate1;
  final dynamic representativeName;
  final dynamic repInitials;
  final dynamic repSignature;
  final dynamic classroomInstructionStartTime;
  final dynamic classroomInstructionEndTime;
  final dynamic makeupAssignment;
  final dynamic classroomInstructionStartDate;
  final dynamic parentName;
  final int noShowFeeAmount;
  final int noShowFeeNoticePeriod;
  final int latePolicyWaitingTime;
  final int propertyDamageFeeAmount;
  final int gasPriceLimit;
  final int fuelSurchargeAmount;
  final String firstName;
  final String middleName;
  final String lastName;
  final String? gender;
  final DateTime? dateOfBirth;
  //final String? gender;
  final String phoneNumber;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final Uint8List? parentInitials;
  final Uint8List? parentSignature;
  final DateTime parentSigningDate;
  final Uint8List? representativeInitials;
  final Uint8List? representativeSignature;
  final DateTime selectedDate;
  //final String classroomInstructionStartDate;
  final String classroomInstructionEndDate;
  final String makeupAssignmentDate;
  final Uint8List? initials;
  final Uint8List? signature;


  const ContactInfoPage({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
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
    required this.signature, this.lessons, this.courseLength, this.lessonLength, this.costPerLesson, this.roadTestPkg, this.totalAmount, this.administrativeExpense, this.courseRate, this.payment11, this.date11, this.payment12, this.date12, this.payment21, this.date21, this.payment22, this.date22, this.payment31, this.date31, this.payment32, this.date32, this.payment41, this.date41, this.payment42, this.date42, this.lessons1, this.courseLength1, this.lessonLength1, this.lessonCost1, this.lessons2, this.courseLength2, this.lessonLength2, this.lessonCost2, this.courseRate1, this.representativeName, this.repInitials,
    this.repSignature, this.classroomInstructionStartTime,
    this.classroomInstructionEndTime, this.makeupAssignment,
    this.parentName, required this.noShowFeeAmount,
    required this.noShowFeeNoticePeriod, required this.latePolicyWaitingTime,
    required this.propertyDamageFeeAmount, required this.gasPriceLimit, required this.fuelSurchargeAmount,

  });

  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  TextEditingController highSchoolController = TextEditingController();
  TextEditingController studentPhoneNumberController = TextEditingController();
  TextEditingController motherPhoneNumberController = TextEditingController();
  TextEditingController fatherPhoneNumberController = TextEditingController();

  late DatabaseReference dbRef;
  late DatabaseReference dbRef2;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('students');
    dbRef2 = FirebaseDatabase.instance.ref().child('course');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text('Contact Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: highSchoolController,
                decoration: InputDecoration(
                  labelText: 'Current High School',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: studentPhoneNumberController,
                decoration: InputDecoration(
                  labelText: "Student's Cell Phone #",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: motherPhoneNumberController,
                decoration: InputDecoration(
                  labelText: "Mother's Cell Phone #",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: fatherPhoneNumberController,
                decoration: InputDecoration(
                  labelText: "Father's Cell Phone #",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final highSchool = highSchoolController.text;
                    final studentPhoneNumber =
                        studentPhoneNumberController.text;
                    final motherPhoneNumber =
                        motherPhoneNumberController.text;
                    final fatherPhoneNumber =
                        fatherPhoneNumberController.text;

                    Map<String, dynamic> students = {
                      'firstName': widget.firstName,
                      'middleName': widget.middleName,
                      'lastName': widget.lastName,
                      'dateOfBirth': widget.dateOfBirth,
                      'gender': widget.gender,
                      'phoneNumber': widget.phoneNumber,
                      'streetAddress': widget.streetAddress,
                      'city': widget.city,
                      'state': widget.state,
                      'zipCode': widget.zipCode,
                      'highSchool': highSchool,
                      'studentPhoneNumber': studentPhoneNumber,
                      'motherPhoneNumber': motherPhoneNumber,
                      'fatherPhoneNumber': fatherPhoneNumber,
                    };
                    dbRef.push().set(students);

                    Map<String, double> course = {
                      'lessonNumber1': 16,
                      'courseLength1': 32,
                      'lessonLength1': 2,
                      'costPerLesson1': 19.5,
                      'lessonNumber2': 7,
                      'courseLength2': 14,
                      'lessonLength2': 2,
                      'costPerLesson2': 9,
                      'courseRate': 375
                    };
                    dbRef2.push().set(course);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sub2(
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
                          parentName: widget.parentName,

                          classroomInstructionStartDate: widget.classroomInstructionStartDate,
                          firstName: widget.firstName,
                          middleName: widget.middleName,
                          lastName: widget.lastName,
                          dateOfBirth: widget.dateOfBirth,
                          gender: widget.gender,
                          phoneNumber: widget.phoneNumber,
                          streetAddress: widget.streetAddress,
                          city: widget.city,
                          state: widget.state,
                          zipCode: widget.zipCode,
                          parentInitials: widget.parentInitials,
                          parentSignature: widget.parentSignature,
                          parentSigningDate: widget.parentSigningDate,
                          representativeInitials: widget.representativeInitials,
                          representativeSignature: widget.representativeSignature,
                          selectedDate: widget.selectedDate,
                          //classroomInstructionStartDate: widget.classroomInstructionStartDate,
                          classroomInstructionEndDate: widget.classroomInstructionEndDate,
                          makeupAssignmentDate: widget.makeupAssignmentDate,
                          initials: widget.initials,
                          signature: widget.signature,
                          highSchool: highSchool,
                          studentPhoneNumber: studentPhoneNumber,
                          motherPhoneNumber: motherPhoneNumber,
                          fatherPhoneNumber: fatherPhoneNumber,
                        ),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












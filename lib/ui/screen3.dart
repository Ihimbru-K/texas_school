
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/sub2.dart';
import 'package:form/ui/submited_data.dart';
import 'package:intl/intl.dart';

class ContactInfoPage extends StatefulWidget {


  final String lessons1;
  final String courseLength1;
  final String lessonLength1;
  final String lessonCost1;

  final String lessons2;
  final String courseLength2;
  final String lessonLength2;
  final String lessonCost2;
  final String courseRate1;

  final String lessons3;
  final String courseLength3;
  final String lessonLength3;
  final String lessonCost3;
  final String courseRate2;


  final String lessons4;
  final String courseLength4;
  final String lessonLength4;
  final String costPerLesson4;
  final String courseRate3;



  final dynamic roadTestPkg;
  final dynamic totalAmount;
  final dynamic administrativeExpense;

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
    required this.signature,  this.roadTestPkg, this.totalAmount, this.administrativeExpense, this.payment11, this.date11, this.payment12, this.date12, this.payment21, this.date21, this.payment22, this.date22, this.payment31, this.date31, this.payment32, this.date32, this.payment41, this.date41, this.payment42, this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate1, this.representativeName, this.repInitials,
    this.repSignature, this.classroomInstructionStartTime,
    this.classroomInstructionEndTime, this.makeupAssignment,
    this.parentName, required this.noShowFeeAmount,
    required this.noShowFeeNoticePeriod, required this.latePolicyWaitingTime,
    required this.propertyDamageFeeAmount, required this.gasPriceLimit, required this.fuelSurchargeAmount, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2, required this.lessons4, required this.courseLength4, required this.lessonLength4, required this.costPerLesson4, required this.courseRate3,

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
                    String formattedDateOfBirth = DateFormat('yyyy-MM-dd').format(widget.dateOfBirth!);
                    Map<String, dynamic> students = {
                      'firstName': widget.firstName,
                      'middleName': widget.middleName,
                      'lastName': widget.lastName,
                      //'dateOfBirth': widget.dateOfBirth?.toString(),
                      'dateOfBirth': formattedDateOfBirth,
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
                    dbRef.push().set(students).then((_) {
                      print("Data pushed to 'students' node successfully");
                    }).catchError((error) {
                      print("Error pushing data to 'students' node: $error");
                    });;
                    print(widget.gender);
                    print(widget.middleName);

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



                         // lessons: widget.lessons,
                         // courseLength: widget.courseLength,
                          //lessonLength: widget.lessonLength,
                         // costPerLesson: widget.costPerLesson,
                          roadTestPkg: widget.roadTestPkg,
                          totalAmount: widget.totalAmount,
                          administrativeExpense: widget.administrativeExpense,
                          //courseRate: widget.courseRate,
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

                          // lessons1: widget.lessons1,
                          // courseLength1: widget.courseLength1,
                          // lessonLength1: widget.lessonLength1,
                          // lessonCost1: widget.lessonCost1,
                          // lessons2: widget.lessons2,
                          // courseLength2: widget.courseLength2,
                          // lessonLength2: widget.lessonLength2,
                          // lessonCost2: widget.lessonCost2,
                          // courseRate1: widget.courseRate1,
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












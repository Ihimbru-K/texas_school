
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/sub2.dart';
import 'package:form/ui/submited_data.dart';

class ContactInfoPage extends StatefulWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String? dateOfBirth;
  final String? gender;
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
  final String classroomInstructionStartDate;
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
    required this.signature,
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
                          classroomInstructionStartDate: widget.classroomInstructionStartDate,
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











// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:form/ui/sub2.dart';
// import 'package:form/ui/submited_data.dart';
//
// class ContactInfoPage extends StatefulWidget {
//   final String firstName;
//   final String middleName;
//   final String lastName;
//   final String? dateOfBirth;
//   final String? gender;
//   final String phoneNumber;
//   final String streetAddress;
//   final String city;
//   final String state;
//   final String zipCode;
//
//   const ContactInfoPage({
//     required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     required this.dateOfBirth,
//     required this.gender,
//     required this.phoneNumber,
//     required this.streetAddress,
//     required this.city,
//     required this.state,
//     required this.zipCode,
//   });
//
//   @override
//   _ContactInfoPageState createState() => _ContactInfoPageState();
// }
//
// class _ContactInfoPageState extends State<ContactInfoPage> {
//   TextEditingController highSchoolController = TextEditingController();
//   TextEditingController studentPhoneNumberController = TextEditingController();
//   TextEditingController motherPhoneNumberController = TextEditingController();
//   TextEditingController fatherPhoneNumberController = TextEditingController();
//
//
//
//  /// Database references pointing to the location of students and course nodes ///
//   late DatabaseReference dbRef;
//   late DatabaseReference dbRef2;
//
//
//   @override
//   void initState() {
//     super.initState();
//     dbRef = FirebaseDatabase.instance.ref().child('students');
//     dbRef2 = FirebaseDatabase.instance.ref().child('course'); //database reference for course node in db
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         centerTitle: true,
//         title: const Text('Contact Information'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: highSchoolController,
//                 decoration: InputDecoration(
//                   labelText: 'Current High School',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               TextField(
//                 controller: studentPhoneNumberController,
//                 decoration: InputDecoration(
//                   labelText: "Student's Cell Phone #",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               TextField(
//                 controller: motherPhoneNumberController,
//                 decoration: InputDecoration(
//                   labelText: "Mother's Cell Phone #",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextField(
//                 controller: fatherPhoneNumberController,
//                 decoration: InputDecoration(
//                   labelText: "Father's Cell Phone #",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0), // Add space here instead of using Spacer
//               Center( // Center the button
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final highSchool = highSchoolController.text;
//                     final studentPhoneNumber =
//                         studentPhoneNumberController.text;
//                     final motherPhoneNumber =
//                         motherPhoneNumberController.text;
//                     final fatherPhoneNumber =
//                         fatherPhoneNumberController.text;
//
//                     Map<String, String?> students = {
//                       'firstName': widget.firstName,
//                       'middleName': widget.middleName,
//                       'lastName': widget.lastName,
//                       'dateOfBirth': widget.dateOfBirth,
//                       'gender': widget.gender,
//                       'phoneNumber': widget.phoneNumber,
//                       'streetAddress': widget.streetAddress,
//                       'city': widget.city,
//                       'state': widget.state,
//                       'zipCode': widget.zipCode,
//                       'highSchool': highSchool,
//                       'studentPhoneNumber': studentPhoneNumber,
//                       'motherPhoneNumber': motherPhoneNumber,
//                       'fatherPhoneNumber': fatherPhoneNumber,
//                     };
//                     dbRef.push().set(students);
//
//                     Map<String, double> course = {
//                       'lessonNumber1' : 16,
//                       'courseLength1' : 32,
//                       'lessonLength1' : 2,
//                       'costPerLesson1': 19.5,
//                       'lessonNumber2' : 7,
//                       'courseLength2' : 14,
//                       'lessonLength2' : 2,
//                       'costPerLesson2': 9,
//                       'courseRate' : 375
//                     };
//                     dbRef2.push().set(course);
//
//
//
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Sub2(
//                           firstName: widget.firstName,
//                           middleName: widget.middleName,
//                           lastName: widget.lastName,
//                           dateOfBirth: widget.dateOfBirth,
//                           gender: widget.gender,
//                           phoneNumber: widget.phoneNumber,
//                           streetAddress: widget.streetAddress,
//                           city: widget.city,
//                           state: widget.state,
//                           zipCode: widget.zipCode,
//                           highSchool: highSchool,
//                           studentPhoneNumber: studentPhoneNumber,
//                           motherPhoneNumber: motherPhoneNumber,
//                           fatherPhoneNumber: fatherPhoneNumber,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Next'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//

import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/sub2.dart';
import 'package:form/ui/update_data.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

import 'mobile.dart';

class SubmitedData extends StatefulWidget {

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
  // const SubmitedData({
  //   Key? key,
  //   required this.firstName,
  //   required this.middleName,
  //   required this.lastName,
  //   this.dateOfBirth,
  //   this.gender,
  //   required this.phoneNumber,
  //   required this.streetAddress,
  //   required this.city,
  //   required this.state,
  //   required this.zipCode,
  //   required this.highSchool,
  //   required this.studentPhoneNumber,
  //   required this.motherPhoneNumber,
  //   required this.fatherPhoneNumber,
  // }) : super(key: key);
  //
  // final String firstName;
  // final String middleName;
  // final String lastName;
  // final String? dateOfBirth;
  // final String? gender;
  // final String phoneNumber;
  // final String streetAddress;
  // final String city;
  // final String state;
  // final String zipCode;
  // final String highSchool;
  // final String studentPhoneNumber;
  // final String motherPhoneNumber;
  // final String fatherPhoneNumber;
  // final dynamic lessons;
  // final dynamic courseLength;
  // final dynamic lessonLength;
  // final dynamic costPerLesson;
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
  // final dynamic lessons1;
  // final dynamic courseLength1;
  // final dynamic lessonLength1;
  // final dynamic lessonCost1;
  // final dynamic lessons2;
  // final dynamic courseLength2;
  // final dynamic lessonLength2;
  // final dynamic lessonCost2;
  // final dynamic courseRate1;
  final dynamic representativeName;
  final dynamic repInitials;
  final dynamic repSignature;
  final dynamic classroomInstructionStartTime;
  final dynamic classroomInstructionEndTime;
  final dynamic makeupAssignment;
  final dynamic parentName;




  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String phoneNumber;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String highSchool;
  final String motherPhoneNumber;
  final String studentPhoneNumber;
  final String fatherPhoneNumber;
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

  const SubmitedData({
    Key? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    this.dateOfBirth,
    this.gender,
    required this.phoneNumber,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.highSchool,
    required this.studentPhoneNumber,
    required this.motherPhoneNumber,
    required this.fatherPhoneNumber,
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
    // this.lessons,
    // this.courseLength,
    // this.lessonLength,
    // this.costPerLesson,
    this.roadTestPkg,
    this.totalAmount,
    this.administrativeExpense,
    this.courseRate,
    this.payment11,
    this.date11,
    this.payment12,
    this.date12,
    this.payment21,
    this.date21,
    this.payment22,
    this.date22,
    this.payment31,
    this.date31,
    this.payment32,
    this.date32,
    this.payment41,
    this.date41,
    this.payment42,
    this.date42,
    // this.lessons1,
    // this.courseLength1,
    // this.lessonLength1,
    // this.lessonCost1,
    // this.lessons2,
    // this.courseLength2,
    // this.lessonLength2,
    // this.lessonCost2,
    // this.courseRate1,
    this.representativeName,
    this.repInitials,
    this.repSignature,
    this.classroomInstructionStartTime,
    this.classroomInstructionEndTime,
    this.makeupAssignment,
    this.parentName, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2, required this.lessons4, required this.courseLength4, required this.lessonLength4, required this.costPerLesson4, required this.courseRate3, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate1,
  }) : super(key: key);

  @override
  State<SubmitedData> createState() => _SubmitedDataState();
}

class _SubmitedDataState extends State<SubmitedData> {
  Query dbRef = FirebaseDatabase.instance
      .ref()
      .child('students'); //query that gets data from the students node
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('students');

  DatabaseReference dbRef2 = FirebaseDatabase.instance
      .ref()
      .child('course'); //Database reference for the course endpoint

  /// variable that will contain data that will be fetched from the course node///

  late Map<String, dynamic> _courseData;

  late Map<String, dynamic> _studentsData;

  late Map<String, dynamic> _classroom$Behind;

  late Map<String, dynamic> _classRoomOnly;

  late Map<String, dynamic> _behindWheelOnly;

  late Map<String, dynamic> _payment1;

  late Map<String, dynamic> _payment2;

  late Map<String, dynamic> _payment3;

  late Map<String, dynamic> _otherData;

  late Map<String, dynamic> _parentInfo;

  late Map<String, dynamic> _repInfo;

  late Map<String, dynamic> _dateStuff;




  @override
  void initState() {
    super.initState();
    pw.Widget buildRepInitials() {


      if (widget.representativeInitials != null) {
        final signatureImage = pw.MemoryImage(widget.repInitials!);

        return pw.Image(signatureImage);
      } else {
        return pw.Text('No signature available');
      }
    }

    pw.Widget buildRepSignature() {
      if (widget.representativeSignature != null) {
        final signatureImage = pw.MemoryImage(widget.repSignature!);

        return pw.Image(signatureImage);
      } else {
        return pw.Text('No signature available');
      }
    }

    pw.Widget buildParentSignature() {
      if (widget.parentSignature != null) {
        final signatureImage = pw.MemoryImage(widget.parentSignature!);

        return pw.Image(signatureImage);
      } else {
        return pw.Text('No signature available');
      }
    }






    pw.Widget buildParentInitials() {
      if (widget.parentInitials != null) {
        final signatureImage = pw.MemoryImage(widget.parentInitials!);

        return pw.Image(signatureImage);
      } else {
        return pw.Text('No signature available');
      }
    }


    _dateStuff = {
      'startDate' : widget.classroomInstructionStartDate.toString(),
      'endDate' : widget.classroomInstructionEndDate.toString(),
      'startTime' : widget.classroomInstructionStartTime.toString(),
      'endTime' : widget.classroomInstructionEndTime.toString(),
      'makeupTime' : widget.makeupAssignment.toString(),
    };



    DateTime repSignDate = widget.parentSigningDate ?? DateTime.now(); // Replace with your desired default value if needed
    String formattedDate = DateFormat('MM-dd-yyyy').format(repSignDate);

    _repInfo = {
      'repInitials' : widget.repInitials,
      'repName' : widget.representativeName,
      'repSignature' : widget.representativeSignature,
      'repSignDate' : formattedDate,


    };


    DateTime parentSignDate = widget.parentSigningDate ?? DateTime.now(); // Replace with your desired default value if needed
    String formattedSignDate = DateFormat('MM-dd-yyyy').format(parentSignDate);

  _parentInfo = {
    'parentInitials ' : widget.parentInitials,
    'parentName' : widget.parentName,
    'parentSignature' : widget.parentSignature,
    'parentSignDate':formattedSignDate,

  };




    _otherData ={

      'testPkg' : widget.roadTestPkg,
      'totalContractAmt' : widget.totalAmount,
      'adminExpenses' : widget.administrativeExpense,
      'noShowfee' : 60,
      'cancelTime': 24,
      'feePerGallon' : ' ',
      'fuelSurcharge' : ' ',
      'fifty' : 50,

    };

    _payment1 = {

      'payment1' : widget.payment11,
      'date1' : widget.date11,
      'payment2' : widget.payment12,
      'date2' : widget.date12,
    };

    _payment2 = {

      'payment1' : widget.payment21,
      'date1' : widget.date21,
      'payment2' : widget.payment22,
      'date2' : widget.date22,


    };

    _payment3 = {

      'payment1' : widget.payment31,
      'date1' : widget.date31,
      'payment2' : widget.payment32,
      'date2' : widget.date32,


    };


    _classroom$Behind = {
      'lessonNum' : widget.lessons1,
      'courseLength' : widget.courseLength1,
      'lessonLength' : widget.lessonLength1,
      'costPerLesson' : widget.lessonCost1,
      'lessonNum1' : widget.lessons2,
      'courseLength1' : widget.courseLength2,
      'lessonLength1' : widget.lessonLength2,
      'costPerLesson1' : widget.lessonCost2,
      'courseRate': widget.courseRate1
    };


    _classRoomOnly = {
      'lessonNumber' : widget.lessons3,
      'courseLength' : widget.courseLength3,
      'lessonLength' : widget.lessonLength3,
      'costPerLesson': widget.lessonCost3,
      'courseRate' : widget.courseRate2

    };




    _behindWheelOnly = {
      'lessonNumber' : widget.lessons4,
      'courseLength' : widget.courseLength4,
      'lessonLength' : widget.lessons4,
      'costPerLesson': widget.costPerLesson4,
      'courseRate' : widget.courseRate3,


    };



    _courseData = {
      'lessonNumber1' : 16,
      'courseLength1' : 32,
      'lessonLength1' : 2,
      'costPerLesson1': 19.5,
      'lessonNumber2' : 7,
      'courseLength2' : 14,
      'lessonLength2' : 2,
      'costPerLesson2': 9,
      'courseRate' : 375
    };



    DateTime dateOfBirth = widget.dateOfBirth ?? DateTime.now(); // Replace with your desired default value if needed
    String formattedDateOfBirth = DateFormat('MM-dd-yyyy').format(dateOfBirth);
    _studentsData = {
      'firstName': widget.firstName,
      'middleName': widget.middleName,
      'lastName': widget.lastName,
      //'dateOfBirth':  DateFormat('yyyy-MM-dd').format(widget.dateOfBirth!),
      'dateOfBirth' : formattedDateOfBirth,

      // 'dateOfBirth': widget.dateOfBirth,
      'gender': widget.gender,
      'phoneNumber': widget.phoneNumber,
      'streetAddress': widget.streetAddress,
      'city': widget.city,
      'state': widget.state,
      'zipCode': widget.zipCode,
      'highSchool': widget.highSchool,
      'studentPhoneNumber': widget.studentPhoneNumber,
      'motherPhoneNumber': widget.motherPhoneNumber,
      'fatherPhoneNumber': widget.fatherPhoneNumber,
    };
    // fetchCourseData();
    // fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submitted Information"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (snapshot.value != null && snapshot.value is Map) {
              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;
              return dataItems(students: student);
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/personal_info');
            },
            label: Text('Return to Form'),
            icon: Icon(Icons.arrow_back),
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 20),
          FloatingActionButton.extended(
            onPressed: () {
            // _downloadContract(_studentsData, _courseData);
              _download2();
            },
            label: Text('Download Contract'),
            icon: Icon(Icons.file_download),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget dataItems({
    required Map students,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${students['firstName'] ?? ''} ${students['middleName'] ?? ''} ${students['lastName'] ?? ''}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          _buildInfoRow(
              label: 'Date of Birth', value: students['dateOfBirth'] ?? ''),
          _buildInfoRow(label: 'Gender', value: students['gender'] ?? ''),
          _buildInfoRow(
              label: 'Phone Number', value: students['phoneNumber'] ?? ''),
          _buildInfoRow(
            label: 'Address',
            value:
                '${students['streetAddress'] ?? ''}, ${students['city'] ?? ''}, ${students['state'] ?? ''}, ${students['zipCode'] ?? ''}',
          ),
          _buildInfoRow(
              label: 'High School', value: students['highSchool'] ?? ''),
          _buildInfoRow(
              label: 'Student Phone #',
              value: students['studentPhoneNumber'] ?? ''),
          _buildInfoRow(
              label: 'Mother Phone #',
              value: students['motherPhoneNumber'] ?? ''),
          _buildInfoRow(
              label: 'Father Phone #',
              value: students['fatherPhoneNumber'] ?? ''),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              UpdateData(studentKey: students['key'])));
                },
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  reference.child(students['key']).remove();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red[700],
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildRow(
      String title1,
      String value1,
      String title2,
      String value2,
      String title3,
      String value3,
      String title4,
      String value4, {
        String? courseRate,
        String? courseRateValue,
      }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
      children: [
        pw.Text('$title1: $value1',),
        pw.SizedBox(width: 6),
        pw.Text('$title2: $value2',  ),
        pw.SizedBox(width: 10),
        pw.Text('$title3: $value3',),
        pw.SizedBox(width: 10),
        pw.Text('$title4: $value4', ),
        if (courseRate != null && courseRateValue != null)
          pw.Text('$courseRate: $courseRateValue', style: const pw.TextStyle(decoration: pw.TextDecoration.underline),),
      ],
    );
  }






Future<void> _download2() async {
    final file = pw.Document();
   file.addPage(
       pw.Page(build: (pw.Context context) {
         return pw.Expanded(
           child: pw.Column(
               children: [
                 pw.Row(
                     children: [
                       pw.Text("Teen Driver Education", style: pw.TextStyle(
                         fontWeight: pw.FontWeight.bold,
                         fontSize: 12,
                       ),),
                       pw.Text(
                         '   STUDENT ENROLLMENT CONTRACT',
                         style: pw.TextStyle(
                           fontWeight: pw.FontWeight.bold,
                           fontSize: 20,
                         ),
                       ),

                     ]
                 ),

                 pw.SizedBox(height: 15),
                 pw.Row(
                     children: [
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '(C2688B)',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               fontWeight: pw.FontWeight.bold,
                               fontSize: 15,
                             ),
                           ),
                           pw.Text(
                             '   School / Branch #',
                             style: pw.TextStyle(
                               fontSize: 9, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   West Texas Driving Academy LLC   .      ',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15,
                                 fontWeight: pw.FontWeight.bold
                             ),
                           ),
                           pw.Text(
                             '                                   Name of School',
                             style: pw.TextStyle(
                               fontSize: 10, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '(915)',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             'Area Code',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   857-1700',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '        Phone Number',
                             style: pw.TextStyle(
                               fontSize: 10, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),






                     ]
                 ),
                 pw.SizedBox(height: 15),
                 pw.Row(
                     children: [
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   12371 EDGEMERE BLVD. STE. 213 .',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               //fontWeight: pw.FontWeight.bold,
                               fontSize: 15,
                             ),
                           ),
                           pw.Text(
                             '                                Classroom Address',
                             style: pw.TextStyle(
                               fontSize: 9, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   El PASO  .      ',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               fontSize: 15,
                               //fontWeight: pw.FontWeight.bold
                             ),
                           ),
                           pw.Text(
                             '                CitY',
                             style: pw.TextStyle(
                               fontSize:8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(height: 10),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             'Texas',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '     State',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   79938',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '         ZIP Code',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),

                     ]
                 ),
                 pw.SizedBox(height: 15),
                 pw.Row(
                     children: [
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             //'.   12371 EDGEMERE BLVD. STE. 213 .',
                             '.   ${_studentsData['firstName'] ?? ''} ${_studentsData['middleName'] ?? ''} ${_studentsData['lastName'] ?? ''} .',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               //fontWeight: pw.FontWeight.bold,
                               fontSize: 15,
                             ),
                           ),
                           pw.Text(
                             '         Printed Full Legal Name of Student',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       // pw.SizedBox(width: 5),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [

                           pw.Text(
                             '.${_studentsData['dateOfBirth']} .  ',
                             // '.   ${_studentsData['dob2']} .  ',

                             // dob' : DateFormat('yyyy-MM-dd').format(_studentsData['dateOfBirth']!),    ',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               fontSize: 15,
                               //fontWeight: pw.FontWeight.bold
                             ),
                           ),
                           pw.Text(
                             'Date of Birth(MM/DD/YY)',
                             style: pw.TextStyle(
                               fontSize:8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(height: 10),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             ' ${_studentsData['gender']}',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '     Gender: M or F ',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '. ${_studentsData['phoneNumber']}',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '        Phone Number',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),

                     ]
                 ),
                 pw.SizedBox(height: 15),
                 pw.Row(
                     children: [
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(

                             '.   ${_studentsData['streetAddress']}   .',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               //fontWeight: pw.FontWeight.bold,
                               fontSize: 13,
                             ),
                           ),
                           pw.Text(
                             '    Street Address of Student   ',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       //pw.SizedBox(width: 4),
                       pw.SizedBox(width: 5),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [

                           pw.Text(
                             '.         ${_studentsData['city']}       . ',
                             // '.   ${_studentsData['dob2']} .  ',

                             // dob' : DateFormat('yyyy-MM-dd').format(_studentsData['dateOfBirth']!),    ',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               fontSize: 15,
                               //fontWeight: pw.FontWeight.bold
                             ),
                           ),
                           pw.Text(
                             '                   City',
                             style: pw.TextStyle(
                               fontSize:8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       //pw.SizedBox(height: 10),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.         ${_studentsData['state']}     .',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '    State ',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '. ${_studentsData['zipCode']} .',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             ' ZIP Code',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),

                     ]
                 ),
                 pw.SizedBox(height: 20),
                 pw.Row(
                     children: [
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(

                             '. ${_studentsData['highSchool']}  .',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               //fontWeight: pw.FontWeight.bold,
                               fontSize: 15,
                             ),
                           ),
                           pw.Text(
                             '       Current High School         ',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                      // pw.SizedBox(width: 5),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [

                           pw.Text(
                             '. ${_studentsData['studentPhoneNumber']} . ',
                             // '.   ${_studentsData['dob2']} .  ',

                             // dob' : DateFormat('yyyy-MM-dd').format(_studentsData['dateOfBirth']!),    ',
                             style: pw.TextStyle(
                               decoration: pw.TextDecoration.underline,
                               fontSize: 15,
                               //fontWeight: pw.FontWeight.bold
                             ),
                           ),
                           pw.Text(
                             '    Student\'s Cell Phone #  .',
                             style: pw.TextStyle(
                               fontSize:8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       //pw.SizedBox(height: 10),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '. ${_studentsData['motherPhoneNumber']} .',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '     Mother\'s Cell # ',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),
                       pw.SizedBox(width: 4),
                       pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Text(
                             '.   ${_studentsData['fatherPhoneNumber']}  .',
                             style: pw.TextStyle(
                                 decoration: pw.TextDecoration.underline,
                                 fontSize: 15
                             ),
                           ),
                           pw.Text(
                             '     Father\'s Cell',
                             style: pw.TextStyle(
                               fontSize: 8, // Adjust font size as needed
                               // Add any other text styles you need for the subtitle
                             ),
                           ),
                         ],
                       ),

                     ]
                 ),

                 pw.SizedBox(height: 13),
                 pw.Align(
                   alignment: pw.Alignment(-1.0, 0.0), // Aligns content to the left

                   child: pw.Text(
                     '□ CLASSROOM & BEHIND-THE-WHEEL INSTRUCTION – CONCURRENT COURSE (TEEN)',
                     style: pw.TextStyle(
                       fontWeight: pw.FontWeight.bold,
                       decoration: pw.TextDecoration.underline,
                     ),
                   ),

                 ),
                 pw.SizedBox(height: 10),
                 //
                 //
                  pw.Row(children: [

                    pw.Row(children: [pw.Text("Number of Lessons ",style: pw.TextStyle(
                        fontSize: 10

                    )), pw.Text(_classroom$Behind['lessonNum'], style: pw.TextStyle(
                     // fontSize: 12, // Adjust font size as needed
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),),],),
                    pw.SizedBox(width: 8,),
                       pw.Row(children: [pw.Text("Length of Course ",style: pw.TextStyle(
                           fontSize: 10

                       ),), pw.Text(_classroom$Behind['courseLength'], style: pw.TextStyle(
                         //fontSize: 8, // Adjust font size as needed
                         fontWeight: pw.FontWeight.bold,
                         decoration: pw.TextDecoration.underline,
                       ),),],),

                       pw.SizedBox(width: 8,),
           pw.Row(children: [pw.Text("Length of Lesson ", style: pw.TextStyle(
             fontSize: 10

           )), pw.Text(_classroom$Behind['lessonLength'], style: pw.TextStyle(
                //fontSize: 8, // Adjust font size as needed
                fontWeight: pw.FontWeight.bold,
                decoration: pw.TextDecoration.underline,
              ),),],),

             // pw.SizedBox(width: 10,),
                    pw.SizedBox(width: 8,),
                       pw.Row(children: [pw.Text("Costs per lesson", style: pw.TextStyle(
                           fontSize: 10

                       ) ), pw.Text(_classroom$Behind['costPerLesson'], style: pw.TextStyle(
                         //fontSize: 8, // Adjust font size as needed
                         fontWeight: pw.FontWeight.bold,
                         decoration: pw.TextDecoration.underline,
                       ),),],),

                       pw.SizedBox(width: 10,),


                  ]),
                 // 'lessonNum' : widget.lessons1,
                 // 'courseLength' : widget.courseLength1,
                 // 'lessonLength' : widget.lessonLength1,
                 // 'costPerLesson' : widget.lessonCost1,
                 // 'lessonNum1' : widget.lessons2,
                 // 'courseLength1' : widget.courseLength2,
                 // 'costPerLesson1' : widget.lessonCost2,
                 // 'courseRate': widget.courseRate1
                 pw.Row(children: [

                   pw.Row(children: [pw.Text("Number of Lessons ",style: pw.TextStyle(
                       fontSize: 10

                   )), pw.Text(_classroom$Behind['lessonNum1'], style: pw.TextStyle(
                     // fontSize: 12, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),
                   pw.SizedBox(width: 8,),
                   pw.Row(children: [pw.Text("Length of Course ",style: pw.TextStyle(
                       fontSize: 10

                   ),), pw.Text(_classroom$Behind['courseLength1'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),

                   pw.SizedBox(width: 8,),

                   pw.Row(children: [pw.Text("Length of Lesson ", style: pw.TextStyle(
                       fontSize: 10

                   )),
                     pw.Text('2hrs', style: pw.TextStyle(
                       //fontSize: 8, // Adjust font size as needed
                       fontWeight: pw.FontWeight.bold,
                       decoration: pw.TextDecoration.underline,
                     ),),],),

                   //   pw.Text(_classroom$Behind['lessonLength12'], style: pw.TextStyle(
                   //   //fontSize: 8, // Adjust font size as needed
                   //   fontWeight: pw.FontWeight.bold,
                   //   decoration: pw.TextDecoration.underline,
                   // ),),],),

                  // pw.SizedBox(width: 10,),
                   pw.SizedBox(width: 8,),
                   pw.Row(children: [pw.Text("Costs per lesson", style: pw.TextStyle(
                       fontSize: 10

                   ) ), pw.Text(_classroom$Behind['costPerLesson1'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),

                   pw.SizedBox(width: 10,),
                   pw.Row(children: [pw.Text("Course rate", style: pw.TextStyle(
                       fontSize: 10

                   ) ), pw.Text(_classroom$Behind['courseRate'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),


         //pw.Text(
         //                 '□ CLASSROOM ONLY (TEEN)-PT',
         //                 style: pw.TextStyle(
         //                   fontWeight: pw.FontWeight.bold,
         //                   decoration: pw.TextDecoration.underline,
         //                 ),
         //               ),




                   // pw.Row(children: [pw.Text("Course Rate \$", style: pw.TextStyle(
                   //     fontSize: 10
                   //
                   // ) ), pw.Text(_classroom$Behind['courseRate'], style: pw.TextStyle(
                   //   //fontSize: 8, // Adjust font size as needed
                   //   fontWeight: pw.FontWeight.bold,
                   //   decoration: pw.TextDecoration.underline,
                   // ),),],),


                 ]),
                 pw.SizedBox(height: 15),

                 pw.Align(
                   alignment: pw.Alignment(-1.0, 0.0), // Aligns content to the left

                   child: pw.Text(
                     '□CLASSROOM ONLY (TEEN)-PT',
                     style: pw.TextStyle(
                       fontWeight: pw.FontWeight.bold,
                       decoration: pw.TextDecoration.underline,
                     ),
                   ),

                 ),
                 pw.Row(children:
                 [

                   pw.Row(children: [pw.Text("Number of Lessons ",style: pw.TextStyle(
                       fontSize: 10

                   )), pw.Text(_classRoomOnly['lessonNumber'], style: pw.TextStyle(
                     // fontSize: 12, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),
                   pw.SizedBox(width: 8,),
                   pw.Row(children: [pw.Text("Length of Course ",style: pw.TextStyle(
                       fontSize: 10

                   ),), pw.Text(_classRoomOnly['courseLength'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),

                   pw.SizedBox(width: 8,),

                   pw.Row(children: [pw.Text("Length of Lesson ", style: pw.TextStyle(
                       fontSize: 10

                   )),
                     pw.Text(_classRoomOnly['lessonLength'], style: pw.TextStyle(
                       //fontSize: 8, // Adjust font size as needed
                       fontWeight: pw.FontWeight.bold,
                       decoration: pw.TextDecoration.underline,
                     ),),],),


                   // pw.SizedBox(width: 10,),
                   pw.SizedBox(width: 8,),
                   pw.Row(children: [pw.Text("Costs per lesson ", style: pw.TextStyle(
                       fontSize: 10

                   ) ), pw.Text(_classRoomOnly['costPerLesson'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),

                   pw.SizedBox(width: 10,),
                   pw.Row(children: [pw.Text("Course rate ", style: pw.TextStyle(
                       fontSize: 10

                   ) ), pw.Text(_classRoomOnly['courseRate'], style: pw.TextStyle(
                     //fontSize: 8, // Adjust font size as needed
                     fontWeight: pw.FontWeight.bold,
                     decoration: pw.TextDecoration.underline,
                   ),),],),



                 ]),



                 pw.SizedBox(height: 15),
                 pw.Align(
                   alignment: pw.Alignment(-1.0, 0.0), // Aligns content to the left

                   child: pw.Text(
                     '□BEHIND-THE-WHEEL ONLY',
                     style: pw.TextStyle(
                       fontWeight: pw.FontWeight.bold,
                       decoration: pw.TextDecoration.underline,
                     ),
                   ),

                 ),
                pw.Row(children:
                [

                  pw.Row(children: [pw.Text("Number of Lessons ",style: pw.TextStyle(
                      fontSize: 10

                  )), pw.Text(_behindWheelOnly['lessonNumber'], style: pw.TextStyle(
                    // fontSize: 12, // Adjust font size as needed
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),),],),
                  pw.SizedBox(width: 8,),
                  pw.Row(children: [pw.Text("Length of Course ",style: pw.TextStyle(
                      fontSize: 10

                  ),), pw.Text(_behindWheelOnly['courseLength'], style: pw.TextStyle(
                    //fontSize: 8, // Adjust font size as needed
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),),],),

                  pw.SizedBox(width: 8,),

                  pw.Row(children: [pw.Text("Length of Lesson ", style: pw.TextStyle(
                      fontSize: 10

                  )),
                    pw.Text(_behindWheelOnly['lessonLength'], style: pw.TextStyle(
                      //fontSize: 8, // Adjust font size as needed
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),),],),

                  //   pw.Text(_classroom$Behind['lessonLength12'], style: pw.TextStyle(
                  //   //fontSize: 8, // Adjust font size as needed
                  //   fontWeight: pw.FontWeight.bold,
                  //   decoration: pw.TextDecoration.underline,
                  // ),),],),

                  // pw.SizedBox(width: 10,),
                  pw.SizedBox(width: 8,),
                  pw.Row(children: [pw.Text("Costs per lesson ", style: pw.TextStyle(
                      fontSize: 10

                  ) ), pw.Text(_behindWheelOnly['costPerLesson'], style: pw.TextStyle(
                    //fontSize: 8, // Adjust font size as needed
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),),],),

                  pw.SizedBox(width: 10,),
                  pw.Row(children: [pw.Text("Course rate ", style: pw.TextStyle(
                      fontSize: 10

                  ) ), pw.Text(_behindWheelOnly['courseRate'], style: pw.TextStyle(
                    //fontSize: 8, // Adjust font size as needed
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),),],),



                ]),
                 pw.SizedBox(height: 7),
                 pw.Row(
                   children: [

                     pw.Column(
                      // mainAxisAlignment: pw.MainAxisAlignment(-),
                       children: [
                         pw.Row(
                           children: [
                             pw.Text("Payment  \$",style: pw.TextStyle(fontSize: 10)), pw.Text(".${_payment1['payment1']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             //sspw.SizedBox(height: 7),
                             pw.Text('  Date:', style: pw.TextStyle(fontSize: 10)),pw.Text('. ${_payment1['date1']}.', style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ),),
                             pw.Text("  Payment  \$", style: pw.TextStyle(fontSize: 10)), pw.Text(".${_payment1['payment2']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             pw.Text('Date:', style: pw.TextStyle(fontSize: 10)),pw.Text('.${_payment1['date2']}.',style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ),),

                           ],
                         ),
                         pw.Row(
                           children: [
                             pw.Text("Payment  \$", style: pw.TextStyle(fontSize: 10)), pw.Text(".${_payment2['payment1']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             pw.Text('Date:', style: pw.TextStyle(fontSize: 10)),pw.Text('.${_payment2['date1']}   .'),
                             pw.Text("Payment  \$", style: pw.TextStyle(fontSize: 10)), pw.Text("${_payment2['payment2']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             pw.Text('Date:'),pw.Text('.${_payment2['date2']} .', style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ),),


                           ],
                         ),
                         pw.Row(
                           children: [
                             pw.Text("Payment  \$",style: pw.TextStyle(fontSize: 10)), pw.Text(".${_payment3['payment1']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             pw.Text('Date:', style: pw.TextStyle(fontSize: 10)),pw.Text('.${_payment3['date1']} .',style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ),),
                             pw.Text("Payment  \$" , style: pw.TextStyle(fontSize: 10)), pw.Text(".${_payment3['payment2']} .", style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),
                             pw.Text('Date:', style: pw.TextStyle(fontSize: 12)),pw.Text('.${_payment3['date2']}.', style: pw.TextStyle(
                               //fontSize: 8, // Adjust font size as needed
                               fontWeight: pw.FontWeight.bold,
                               decoration: pw.TextDecoration.underline,
                             ), ),


                           ],
                         ),

                       ],
                     ),
                     pw.Column(
                       children: [

                     // _otherData ={
                     // 'testPkg' : widget.roadTestPkg,
                     // 'totalContractAmt' : widget.totalAmount,
                     // 'adminExpenses' : widget.administrativeExpense,
                     // 'noShowfee' : 60,
                     // 'cancelTime': 24,
                     // 'feePerGallon' : null,
                     // 'fuelSurcharge' : null,
                     //
                     // };


                         pw.Row(
                           children: [pw.Text("Road Test PKG   \$"), pw.Text(". ${_otherData['testPkg']}  .", style: pw.TextStyle(
                             //fontSize: 8, // Adjust font size as needed
                             fontWeight: pw.FontWeight.bold,
                             decoration: pw.TextDecoration.underline,
                           ), )],
                         ),

                         pw.Row(
                           children: [pw.Text("  Total Amount of Contract   \$"), pw.Text(". ${_otherData['totalContractAmt']}  .", style: pw.TextStyle(
                             //fontSize: 8, // Adjust font size as needed
                             fontWeight: pw.FontWeight.bold,
                             decoration: pw.TextDecoration.underline,
                           ), )],
                         ),

                         pw.Row(
                           children: [pw.Text("  Administrative Expenses   \$", style: pw.TextStyle(fontSize: 12)), pw.Text(". ${_otherData['adminExpenses']}   .", style: pw.TextStyle(
                             //fontSize: 8, // Adjust font size as needed
                             fontWeight: pw.FontWeight.bold,
                             decoration: pw.TextDecoration.underline,
                           ), )],
                         ),

                       ],
                     ),

                   ],
                 ),
                  pw.SizedBox(height: 10),
                 pw.Column(
                   crossAxisAlignment: pw.CrossAxisAlignment.start,
                   children: [




                     pw.Row(children: [ pw.Text("A no-show fee of "), pw.Text('  \$${_otherData['noShowfee']}  ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)),pw.Text(' will be charged if the school is not notified of a cancellation at least'),pw.Text('  ${_otherData['cancelTime']}  ', style: pw.TextStyle( fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline))]),

pw.Text(' hours prior to a scheduled in-car lesson '),


                     pw.Row(children: [pw.Text(" 'Instructor is only allowed to wait 5 minutes after scheduled time if student is late to drive a \"No Show\"'"),]),
                     pw.Text('fee will incur'),

                     pw.Row(children: [ pw.Text('A fee of '), pw.Text('\$${_otherData['fifty']}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" will be charged if a student defaces or damages any school property '") ]),
                     pw.Text('(desks, tables, textbooks, etc.)'),




             pw.Row(children: [pw.Text("If gas prices exceed "), pw.Text('\$${_otherData['feePerGallon']}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" per gallon, an additional fuel surcharge of "), pw.Text('\$${_otherData['fuelSurcharge']}, ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" will be charged for each ") ]),
                     pw.Row(
                         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                         children: [pw.Text('driving lesson.'),
                      pw.Row(children: [
                        pw.Row(
                          children: [
                            pw.Text('Parents initials concerning Fees',style: pw.TextStyle(fontWeight: pw.FontWeight.bold) ),
             pw.Center(
               child: buildRepInitials(),
             ),

                          ],
                        ),
                        pw.SizedBox(height: 15),
                        // _dateStuff = {
                        //   'startDate' : widget.classroomInstructionStartDate,
                        //   'endDate' : widget.classroomInstructionEndDate,
                        //   'startTime' : widget.classroomInstructionStartTime,
                        //   'endTime' : widget.classroomInstructionEndTime,
                        // };




                        // pw.Row(
                        //   children: [
                        //     pw.Text('Parents initials concerning Fees'),
                        //     pw.Center(
                        //       child: pw.Image.memory(
                        //         _parentInfo['initials'],
                        //         width: 40,
                        //         height: 40,
                        //         fit: pw.BoxFit.cover,
                        //       ),
                        //     ),
                        //   ],
                        // )


                        // pw.Row(
                        //   children: [
                        //     pw.Text('Parents initials concerning Fees'),
                        //     pw.Center(
                        //       child: pw.Image.memory(
                        //         _parentInfo['initials'],
                        //         width: 40,
                        //         height: 40,
                        //         fit: pw.BoxFit.cover,
                        //       ),
                        //     ),
                        //   ],
                        // )
                        // // pw.Center(
                        //   child: Image.memory(
                        //     ${_parentInfo['initials']},
                        //     width: 40,
                        //     height: 40,
                        //     fit: BoxFit.cover,
                        //   ),),
                        // )

                       // pw.Text('${_parentInfo['parentInitials']}')



                      ]) ]),


                     pw.SizedBox(height: 20),

                     pw.Row(children: [
                       pw.Text("Classroom instruction begins "),
                       pw.Text('. ${_dateStuff['startDate']} .', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" from  "), pw.Text('. ${_dateStuff['starTime']} .', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" to "), pw.Text('. ${_dateStuff['EndTime']} .', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)), pw.Text(" o'clock  "), pw.Text('and is expected to end')
                     ]),
                     pw.Row(children: [
                       pw.Text('. ${_dateStuff['endDate']} .', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)),pw.Text("All classroom make-up assignments and in-car instruction must be completed by "),
                     ]),
                     pw.Row(
                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                       children: [

                       pw.Row(children: [
                         pw.Text('. ${_dateStuff['makeupTime']} .', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)),  pw.Text("*********")]),
                         pw.Row(
                           children: [
                             pw.Text('Parents initials concerning Dates',style: pw.TextStyle(fontWeight: pw.FontWeight.bold) ),
                             pw.Center(
                               child: buildRepInitials(),
                             ),

                           ],
                         ),



                       ],

                     ),

                     pw.Row(children: [
                       pw.Text("\$100 CONTRACT RENEWAL will be granted to extend contract to finish drives:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9
                       )), pw.Row(
                         children: [
                           pw.Text('Parents initials concerning Renewal',style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10.5) ),
                           pw.Center(
                             child: buildRepInitials(),
                           ),

                         ],
                       ),


                     ]),
                    pw.Text("(45 day extension; must be renewed BEFORE contract expiration date)"),
                     pw.SizedBox(height: 15),

                     pw.Row(children: [pw.Text("Student fee must be payed", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9) ),pw.Text(" BEFORE " ,style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9, decoration: pw.TextDecoration.underline) ), pw.Text("DE-964 certificate can be issued   ", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9) ),
                       pw.Row(
                         children: [
                           pw.Text('Parents initials concerning Certificate',style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10.5) ),
                           pw.Center(
                             child: buildRepInitials(),
                           ),


                         ],
                       ),




                     ]),






                   ]
                 ),

         ]

           ),
         );
       },

       ),




   );

    file.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Row(children: [pw.Text("(Parent must pick up certificate and sign “Student Acknowledgment” to receive certificate."),   ]),
              pw.Row(children: [
                pw.Row(children: [
                 // pw.Text("Road Test (driving test) expires after 60 days from",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, fontSize: 9 )),pw.Text("Eligibility date ON permit.", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, fontSize: 9 )),


                  pw.Row(children: [
pw.Row(children: [
pw.Text("Road Test (driving test) expires after 60 days from ", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, fontSize: 9 )),pw.Text("Eligibility date ON permit.", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, fontSize: 9  )),


],),
pw.Row(
children: [
pw.Text('Parents initials concerning RT ',style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10.5) ),
pw.Center(
child: buildRepInitials(),
),


],
),
])

                ],)
              ]),

           pw.Row(children: [pw.Text(" (Road Test must be repaid if contract expires; no refunds are given; 3 attempts within timeframe.) ")]),
              pw.SizedBox(height: 15),
              pw.Align(
                alignment: pw.Alignment(-1.0, 0.0), // Aligns content to the left

                child: pw.Text(
                  'ATTENDANCE/ABSENCE',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
                ),

              ),
              pw.SizedBox(height: 5),
              pw.Text('A full hour of absence is charged to the student when he/she does not attend the full 55 minutes of instruction during a 60-minute period. If a student is absent in excess of 10 classroom hours, '),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
          pw.Text("the student enrollment will be terminated."),
          pw.Row(
            children: [
              pw.Text('Parents initials',style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10.5) ),
              pw.Center(
                child: buildRepInitials(),
              ),


            ],
          ),


        ]),

              pw.SizedBox(height: 15),
              pw.Align(
                alignment: pw.Alignment(-1.0, 0.0), // Aligns content to the left

                child: pw.Text(
                  'ACKNOWLEDGEMENT',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
                ),

              ),
              pw.SizedBox(height: 5),
              pw.Text("I have been furnished with the school’s tuition and fees; cancellation and refund policy; and school regulations pertaining to absence, grading policy, "),
              pw.Text('progress, and rules of operation and conduct. I further realize that any grievances not resolved by the school may be forwarded to: TDLR, PO BOX'),
              pw.Row(children: [pw.Text('12157, AUSTIN, TX, 78711. Telephone: (800) 803-9202. '),
              ]),
              pw.SizedBox(height: 20),
              pw.Text("• This agreement constitutes the entire contract between the school and the student and no verbal assurances or promises not contained herein shall bind the school or the student."),
              pw.SizedBox(height: 4),
              pw.Text("• The school is prohibited from issuing a DE-964 if the student has not met all of the requirements for course completion, and the student should not accept a DE-964 under such circumstances."),
              pw.SizedBox(height: 4),
              pw.Text("• This driver education school maintains business vehicle insurance as required by the Transportation Code, Chapter 601, and uninsured or underinsured coverage."),

              pw.SizedBox(height: 12),
              pw.Row(children: [
                pw.Text("READ ENTIRE CONTRACT BEFORE SIGNING", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline),),
                pw.Text('A copy of the contract must be given to the parent and a copy maintained by the school.', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))


              ],),
              pw.SizedBox(height: 20),

              pw.Row(
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(
                          text: '.                    .', style: pw.TextStyle(decoration: pw.TextDecoration.underline),
                          children: [
                            pw.WidgetSpan(child: buildParentSignature()),
                            pw.TextSpan(text: '.                 .', style: pw.TextStyle(decoration: pw.TextDecoration.underline, fontSize: 15)),
                          ],
                        ),
                      ),
                      pw.Text(
                        'Signature of Parent / Legal Guardian – student younger than 18              ',
                        style: pw.TextStyle(
                          fontSize: 7, // Adjust font size as needed
                          // Add any other text styles you need for the subtitle
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 4),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '.   ${_parentInfo['parentName']}      ',
                        style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 15,
                          //fontWeight: pw.FontWeight.bold
                        ),
                      ),
                      pw.Text(
                        '       Printed Name of Parent / Legal Guardian          ',
                        style: pw.TextStyle(
                          fontSize: 8, // Adjust font size as needed
                          // Add any other text styles you need for the subtitle
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '${_parentInfo['parentSignDate']}',
                        style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 15,
                        ),
                      ),
                      pw.Text(
                        '     Date',
                        style: pw.TextStyle(
                          fontSize: 8, // Adjust font size as needed
                          // Add any other text styles you need for the subtitle
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // pw.Row(
              //     children: [
              //       pw.Column(
              //         crossAxisAlignment: pw.CrossAxisAlignment.start,
              //         children: [
              //           pw.Text(
              //             '.   ${buildParentSignature()}         .',
              //             style: pw.TextStyle(
              //               decoration: pw.TextDecoration.underline,
              //               //fontWeight: pw.FontWeight.bold,
              //               fontSize: 15,
              //             ),
              //           ),
              //           pw.Text(
              //             'Signature of Parent / Legal Guardian – student younger than 18              ',
              //             style: pw.TextStyle(
              //               fontSize: 7, // Adjust font size as needed
              //               // Add any other text styles you need for the subtitle
              //             ),
              //           ),
              //         ],
              //       ),
              //      // pw.SizedBox(width: 4),
              //       pw.Column(
              //         crossAxisAlignment: pw.CrossAxisAlignment.start,
              //         children: [
              //           pw.Text(
              //             '.   ${_parentInfo['parentName']}      ',
              //             style: pw.TextStyle(
              //               decoration: pw.TextDecoration.underline,
              //               fontSize: 15,
              //               //fontWeight: pw.FontWeight.bold
              //             ),
              //           ),
              //           pw.Text(
              //             '       Printed Name of Parent / Legal Guardian          ',
              //             style: pw.TextStyle(
              //               fontSize:8, // Adjust font size as needed
              //               // Add any other text styles you need for the subtitle
              //             ),
              //           ),
              //         ],
              //       ),
              //
              //
              //
              //       pw.Column(
              //         crossAxisAlignment: pw.CrossAxisAlignment.start,
              //         children: [
              //           pw.Text(
              //             '${_parentInfo['parentSignDate']}',
              //             style: pw.TextStyle(
              //                 decoration: pw.TextDecoration.underline,
              //                 fontSize: 15
              //             ),
              //           ),
              //           pw.Text(
              //             '     Date',
              //             style: pw.TextStyle(
              //               fontSize: 8, // Adjust font size as needed
              //               // Add any other text styles you need for the subtitle
              //             ),
              //           ),
              //         ],
              //       ),
              //
              //
              //
              //     ]
              // ),
              pw.SizedBox(height: 15),
              pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.RichText(
                          text: pw.TextSpan(
                            text: '.                    .', style: pw.TextStyle(decoration: pw.TextDecoration.underline),
                            children: [
                              pw.WidgetSpan(child: buildRepSignature()),
                              pw.TextSpan(text: '.                 .', style: pw.TextStyle(decoration: pw.TextDecoration.underline, fontSize: 15)),
                            ],
                          ),
                        ),
                        pw.Text(
                          '                  Signature of school Representative              ',
                          style: pw.TextStyle(
                            fontSize: 7, // Adjust font size as needed
                            // Add any other text styles you need for the subtitle
                          ),
                        ),
                      ],
                    ),
                    // pw.Column(
                    //   crossAxisAlignment: pw.CrossAxisAlignment.start,
                    //   children: [
                    //     pw.Text(
                    //       '.   ${buildRepSignature()}         .',
                    //       style: pw.TextStyle(
                    //         decoration: pw.TextDecoration.underline,
                    //         //fontWeight: pw.FontWeight.bold,
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //     pw.Text(
                    //       'Signature of Parent / Legal Guardian – student younger than 18              ',
                    //       style: pw.TextStyle(
                    //         fontSize: 7, // Adjust font size as needed
                    //         // Add any other text styles you need for the subtitle
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // pw.SizedBox(width: 4),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          '.   ${_repInfo['repName']}      ',
                          style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontSize: 15,
                            //fontWeight: pw.FontWeight.bold
                          ),
                        ),
                        pw.Text(
                          '        Signature  of School Representative         ',
                          style: pw.TextStyle(
                            fontSize:8, // Adjust font size as needed
                            // Add any other text styles you need for the subtitle
                          ),
                        ),
                      ],
                    ),

                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          '${_repInfo['repSignDate']}',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontSize: 15
                          ),
                        ),
                        pw.Text(
                          '     Date',
                          style: pw.TextStyle(
                            fontSize: 8, // Adjust font size as needed
                            // Add any other text styles you need for the subtitle
                          ),
                        ),
                      ],
                    ),



                  ]
              ),




            ],
          );
        },
      ),
    );

    final bytes = await file.save();

    saveAndLaunchFile(bytes, "Contract.pdf");

}





  pw.Widget _buildUnderlinedRow(
      String text1, String text2, String text3, String text4) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
      children: [
        pw.Text(text1,
            style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
        pw.Text(text2,
            style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
        pw.Text(text3,
            style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
        pw.Text(text4,
            style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
      ],
    );
  }

  pw.Widget _buildDataRow(String label, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        pw.Text(label + ':'),
        pw.SizedBox(width: 10),
        pw.Text(value),
      ],
    );
  }

  pw.Widget buildRepInitials() {
    if (widget.parentInitials != null) {
      final signatureImage = pw.MemoryImage(widget.parentInitials!);

      return pw.Image(signatureImage, width: 20,
      );
    } else {
      return pw.Text('No signature available');
    }
  }

  pw.Widget buildParentSignature() {
    if (widget.signature != null) {
      final signatureImage = pw.MemoryImage(widget.signature!);

      return pw.Image(signatureImage, width: 20,
      );
    } else {
      return pw.Text('No signature available');
    }
  }

  pw.Widget buildRepSignature() {
    if (widget.representativeSignature != null) {
      final signatureImage = pw.MemoryImage(widget.representativeSignature!);

      return pw.Image(signatureImage, width: 20,
      );
    } else {
      return pw.Text('No signature available');
    }
  }

  pw.Widget buildParentInitials() {
    if (widget.representativeInitials != null) {
      final signatureImage = pw.MemoryImage(widget.representativeInitials!);

      return pw.Image(signatureImage, width: 20,
      );
    } else {
      return pw.Text('No signature available');
    }
  }



}

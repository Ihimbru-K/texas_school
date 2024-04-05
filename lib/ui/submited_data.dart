import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/sub2.dart';
import 'package:form/ui/update_data.dart';
import 'package:pdf/widgets.dart' as pw;

import 'mobile.dart';

class SubmitedData extends StatefulWidget {
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

  late Map<String, dynamic> _classRoomOnly;

  late Map<String, dynamic> _behindWheelOnly;

  late Map<String, dynamic> _payment1;

  late Map<String, dynamic> _payment2;

  late Map<String, dynamic> _payment3;

  late Map<String, dynamic> _otherData;


  @override
  void initState() {
    super.initState();


    _otherData ={
      'testPkg' : 100,
      'totalContractAmt' : null,
      'adminExpenses' : 50,
      'noShowfee' : 60,
      'cancelTime': 24,
      'feePerGallon' : null,
      'fuelSurcharge' : null,

    };

    _payment1 = {

      'payment1' : Text('__', style: TextStyle(decoration: TextDecoration.underline),),
      'date1' : null,
      'payment2' : null,
      'date2' : null,
    };

    _payment2 = {

      'payment1' : null,
      'date1' : null,
      'payment2' : null,
      'date2' : null,


    };

    _payment3 = {

      'payment1' : null,
      'date1' : null,
      'payment2' : null,
      'date2' : null,


    };



    _behindWheelOnly = {
      'lessonNumber' : 1,
      'courseLength' : 1,
      'lessonLength' : null,
      'costPerLesson': 45,
      'courseRate' : null,


    };

    _classRoomOnly = {
      'lessonNumber' : 16,
      'courseLength' : 32,
      'lessonLength' : 2,
      'costPerLesson': 19.5,
      'courseRate' : 375


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




    _studentsData = {
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
          // FloatingActionButton.extended(
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //           context, MaterialPageRoute(builder: (context) => Sub2()));
          //     },
          //     label: Text('Sub2')),
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
            onPressed: () async {
              _downloadContract(_studentsData, _courseData);
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




  pw.Widget _buildRow2(
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
        pw.SizedBox(width:3 ),
        pw.Text('$title2: $value2',  ),
        pw.SizedBox(width: 3),
        pw.Text('$title3: $value3',),
        pw.SizedBox(width: 3),
        pw.Text('$title4: $value4', ),
        if (courseRate != null && courseRateValue != null)
          pw.Text('$courseRate: $courseRateValue', style: const pw.TextStyle(decoration: pw.TextDecoration.underline),),
      ],
    );
  }











  void _downloadContract(
      Map<String, dynamic> students, Map<dynamic, dynamic> course) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Teen Driver Education STUDENT ENROLLMENT CONTRACT',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              _buildUnderlinedRow('C2688B', 'West Texas Driving Academy LLC.',
                  '(915)', '857-1700'),
              _buildUnderlinedRow('School / Branch #', 'Name of School',
                  'Area Code', 'Phone Number'),
              _buildUnderlinedRow(
                  '12371 EDGEMERE BLVD. STE. 213', 'El Paso', 'Texas', '79938'),
              _buildUnderlinedRow(
                  'Classroom Address', 'City', 'State', 'ZIP Code'),
              _buildDataRow('Printed Full Legal Name of Student',
                  '${students['firstName'] ?? ''} ${students['middleName'] ?? ''} ${students['lastName'] ?? ''}'),
              _buildDataRow(
                  'Date of Birth(MM/DD/YY)', students['dateOfBirth'] ?? ''),
              _buildDataRow('Gender', students['gender'] ?? ''),
              _buildDataRow(
                  'Area Code Phone Number', students['phoneNumber'] ?? ''),
              _buildDataRow(
                  'Street Address of Student', students['streetAddress'] ?? ''),
              _buildDataRow(_studentsData['city'], ''),
              _buildDataRow('State', students['state'] ?? ''),
              _buildDataRow('ZIP Code', students['zipCode'] ?? ''),
              _buildDataRow(
                  'Current High School', students['highSchool'] ?? ''),
              _buildDataRow('Student\’\s Cell Phone #',
                  students['studentPhoneNumber'] ?? ''),
              _buildDataRow(
                  'Mother’s Cell #', students['motherPhoneNumber'] ?? ''),
              _buildDataRow(
                  'Father’s Cell #', students['fatherPhoneNumber'] ?? ''),
              pw.SizedBox(height: 10),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '□ CLASSROOM & BEHIND-THE-WHEEL INSTRUCTION – CONCURRENT COURSE (TEEN)',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  _buildRow(
                    'Number of Lessons',
                    '${course['lessonNumber1']}',
                    'Length of Course',
                    '${course['courseLength1']} hrs',
                    'Length of Lesson',
                    '${course['lessonLength1']} Hrs',
                    'Cost per Lesson',
                    '\$${course['costPerLesson1']}',
                  ),
                  pw.SizedBox(height: 10),
                  _buildRow(
                    'Number of Lessons',
                    '${course['lessonNumber2']}',
                    'Length of Course',
                    '${course['courseLength2']} hrs',
                    'Length of Lesson',
                    '${course['lessonLength2']} Hrs',
                    'Cost per Lesson',
                    '\$${course['costPerLesson2']}',
                    courseRate: 'Course Rate',
                    courseRateValue: '\$${course['courseRate']}',
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '□ CLASSROOM ONLY (TEEN)-PT',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
                ),
                pw.SizedBox(height: 10),
                _buildRow(
                  'Number of Lessons',
                  '${_classRoomOnly['lessonNumber']}',
                  'Length of Course',
                  '${_classRoomOnly['courseLength']} hrs',
                  'Length of Lesson',
                  '${_classRoomOnly['lessonLength']} Hrs',
                  'Cost per Lesson',
                  '\$${_classRoomOnly['costPerLesson']}',
                ),
                pw.SizedBox(height: 10),
          pw.Text(
          ' □ BEHIND-THE-WHEEL ONLY',
          style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          decoration: pw.TextDecoration.underline,
          ),
          ),
          pw.SizedBox(height: 10),
                _buildRow(
                  'Number of Lessons',
                  '${_behindWheelOnly['lessonNumber']}',
                  'Length of Course',
                  '${_behindWheelOnly['courseLength']} hrs',
                  'Length of Lesson',
                  '${_behindWheelOnly['lessonLength']} Hrs',
                  'Cost per Lesson',
                  '\$${_behindWheelOnly['costPerLesson']}',
                ),
                _buildRow2(
                  'Payment: ',
                  '\$   ${_payment1['payment1']}',
                  'Date',
                  '${_payment1['date1']} hrs',
                  'Payment',
                  '\$   ${_payment1['payment2']} Hrs',
                  'Date',
                  '${_payment1['date2']}',
                ),
                _buildRow2(
                  'Payment: ',
                  '\$   ${_payment2['payment1']}',
                  'Date',
                  '${_payment2['date1']} hrs',
                  'Payment',
                  '\$   ${_payment2['payment2']} Hrs',
                  'Date',
                  '${_payment2['date2']}',
                ),
                _buildRow2(
                  'Payment: ',
                  '\$   ${_payment3['payment1']}',
                  'Date',
                  '${_payment3['date1']} hrs',
                  'Payment',
                  '\$   ${_payment3['payment2']} Hrs',
                  'Date',
                  '${_payment3['date2']}',
                ),




              ],
              ),
            ],
          );
        },
      ),
    );

    final bytes = await pdf.save();

    saveAndLaunchFile(bytes, "Sizing.pdf");
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
}

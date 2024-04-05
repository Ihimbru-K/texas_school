import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:form/ui/submited_data.dart';
import 'package:form/ui/update_data.dart';

class Sub2 extends StatefulWidget {
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

  const Sub2({
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
  State<Sub2> createState() => _Sub2State();
}

class _Sub2State extends State<Sub2> {
  late DatabaseReference dbRef;
  late DatabaseReference dbRef2;

  @override
  void initState() {
    super.initState();
    dbRef2 = FirebaseDatabase.instance.ref().child('course');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course information"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: dbRef2,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            if (snapshot.value != null && snapshot.value is Map) {
              Map course = snapshot.value as Map;
              course['key'] = snapshot.key;
              return dataItems2(context, course: course);
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubmitedData(
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
                    highSchool: widget.highSchool,
                    studentPhoneNumber: widget.studentPhoneNumber,
                    motherPhoneNumber: widget.motherPhoneNumber,
                    fatherPhoneNumber: widget.fatherPhoneNumber,
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
                  ),
                ),
              );
            },
            child: Text('Next'),
          ),
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
              //_downloadContract(_studentsData);
            },
            label: Text('Download Contract'),
            icon: Icon(Icons.file_download),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget dataItems2(BuildContext context, {required Map course}) {
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
            '${course['firstName'] ?? ''} ${course['middleName'] ?? ''} ${course['lastName'] ?? ''}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          _buildInfoRow(label: 'Course length', value: '${course['courseLength1']}' ?? ''),
          _buildInfoRow(label: 'Phone Number', value: '${course['courseLength2']}' ?? ''),
          _buildInfoRow(label: 'Course rate #', value: '${course['courseRate']}' ?? ''),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateData(studentKey: course['key'])));
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
                  //  reference.child(students['key']).remove();
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
}
















// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:form/ui/submited_data.dart';
// import 'package:form/ui/update_data.dart';
// import '';
//
// class Sub2 extends StatefulWidget {
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
//   final String highSchool;
//   final String motherPhoneNumber;
//   final String studentPhoneNumber;
//   final String fatherPhoneNumber;
//
//   const Sub2({Key? key,
//   required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     this.dateOfBirth,
//     this.gender,
//     required this.phoneNumber,
//     required this.streetAddress,
//     required this.city,
//     required this.state,
//     required this.zipCode,
//     required this.highSchool,
//     required this.studentPhoneNumber,
//     required this.motherPhoneNumber,
//     required this.fatherPhoneNumber,
//
//
//
//
//   }) : super(key: key);
//
//
//
//   @override
//   State<Sub2> createState() => _Sub2State();
// }
//
// class _Sub2State extends State<Sub2> {
//   //DatabaseReference dbRef3 = FirebaseDatabase.instance.ref().child('course'); //Database reference for the course node
//   /// Database references pointing to the location of students and course nodes ///
//   late DatabaseReference dbRef;
//   late DatabaseReference dbRef2;
//
//
//   @override
//   void initState() {
//     super.initState();
//     //dbRef = FirebaseDatabase.instance.ref().child('students');
//     dbRef2 = FirebaseDatabase.instance.ref().child('course'); //database reference for course node in db
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Course information"),
//         centerTitle: true,
//         elevation: 2,
//       ),
//       // body: Column(
//       //   children: [
//       //
//       //     Center( // Center the button
//       //       child: ElevatedButton(
//       //         onPressed: () async {
//       //
//       //
//       //           Map<String, double> course = {
//       //             'lessonNumber1' : 16,
//       //             'courseLength1' : 32,
//       //             'lessonLength1' : 2,
//       //             'costPerLesson1': 19.5,
//       //             'lessonNumber2' : 7,
//       //             'courseLength2' : 14,
//       //             'lessonLength2' : 2,
//       //             'costPerLesson2': 9,
//       //             'courseRate' : 375
//       //           };
//       //           dbRef2.push().set(course);
//       //
//       //
//       //
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(
//       //               builder: (context) => SubmitedData(
//       //                 firstName: widget.firstName,
//       //                 middleName: widget.middleName,
//       //                 lastName: widget.lastName,
//       //                 dateOfBirth: widget.dateOfBirth,
//       //                 gender: widget.gender,
//       //                 phoneNumber: widget.phoneNumber,
//       //                 streetAddress: widget.streetAddress,
//       //                 city: widget.city,
//       //                 state: widget.state,
//       //                 zipCode: widget.zipCode,
//       //                 highSchool: widget.highSchool,
//       //                 studentPhoneNumber: widget.studentPhoneNumber,
//       //                 motherPhoneNumber: widget.motherPhoneNumber,
//       //                 fatherPhoneNumber: widget.fatherPhoneNumber,
//       //               ),
//       //             ),
//       //           );
//       //         },
//       //         child: Text('Next'),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//
//       body: Container(
//         child: FirebaseAnimatedList(
//           query: dbRef2,
//           itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
//             if (snapshot.value != null && snapshot.value is Map) {
//               Map course = snapshot.value as Map;
//               course['key'] = snapshot.key;
//               return dataItems2(context, course: course);
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//
//
//
//
//
//
//
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SubmitedData(
//                     firstName: widget.firstName,
//                     middleName: widget.middleName,
//                     lastName: widget.lastName,
//                     dateOfBirth: widget.dateOfBirth,
//                     gender: widget.gender,
//                     phoneNumber: widget.phoneNumber,
//                     streetAddress: widget.streetAddress,
//                     city: widget.city,
//                     state: widget.state,
//                     zipCode: widget.zipCode,
//                     highSchool: widget.highSchool,
//                     studentPhoneNumber: widget.studentPhoneNumber,
//                     motherPhoneNumber: widget.motherPhoneNumber,
//                     fatherPhoneNumber: widget.fatherPhoneNumber,
//                   ),
//                 ),
//               );
//             },
//             child: Text('Next'),
//           ),
//           FloatingActionButton.extended(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/personal_info');
//
//             },
//             label: Text('Return to Form'),
//             icon: Icon(Icons.arrow_back),
//             backgroundColor: Colors.blue,
//           ),
//           SizedBox(width: 20),
//           FloatingActionButton.extended(
//             onPressed: () async {
//               //_downloadContract(_studentsData);
//             },
//             label: Text('Download Contract'),
//             icon: Icon(Icons.file_download),
//             backgroundColor: Colors.blue,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget dataItems2(BuildContext context, {required Map course}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '${course['firstName'] ?? ''} ${course['middleName'] ?? ''} ${course['lastName'] ?? ''}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(height: 15),
//           _buildInfoRow(label: 'Course length', value: '${course['courseLength1']}' ?? ''),
//           _buildInfoRow(label: 'Phone Number', value: '${course['courseLength2']}' ?? ''),
//           _buildInfoRow(label: 'Course rate #', value: '${course['courseRate']}' ?? ''),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateData(studentKey: course['key'])));
//                 },
//                 child: Icon(
//                   Icons.edit,
//                   color: Theme.of(context).primaryColor,
//                   size: 30,
//                 ),
//               ),
//               SizedBox(width: 20),
//               GestureDetector(
//                 onTap: () {
//                   //  reference.child(students['key']).remove();
//                 },
//                 child: Icon(
//                   Icons.delete,
//                   color: Colors.red[700],
//                   size: 30,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow({required String label, required String value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '$label: ',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[800],
//             ),
//           ),
//           SizedBox(width: 5),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[800],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_database/ui/firebase_animated_list.dart';
// // import 'package:flutter/material.dart';
// // import 'package:form/ui/update_data.dart';
// //
// // class Sub2 extends StatefulWidget {
// //   const Sub2({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Sub2> createState() => _Sub2State();
// // }
// //
// // class _Sub2State extends State<Sub2> {
// //   DatabaseReference dbRef3 = FirebaseDatabase.instance.ref().child('course'); //Database reference for the course endpoint
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Submitted Information"),
// //         centerTitle: true,
// //         elevation: 2,
// //       ),
// //       body: Container(
// //         child: FirebaseAnimatedList(
// //           query: dbRef3,
// //           itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
// //             if (snapshot.value != null && snapshot.value is Map) {
// //               Map course = snapshot.value as Map;
// //               course['key'] = snapshot.key;
// //               return dataItems2(course: course);
// //             } else {
// //               return Container();
// //             }
// //           },
// //         ),
// //       ),
// //       floatingActionButton: Row(
// //         mainAxisAlignment: MainAxisAlignment.end,
// //         children: [
// //           FloatingActionButton.extended(
// //             onPressed: () {
// //               Navigator.pushReplacementNamed(context, '/personal_info');
// //             },
// //             label: Text('Return to Form'),
// //             icon: Icon(Icons.arrow_back),
// //             backgroundColor: Colors.blue,
// //           ),
// //           SizedBox(width: 20),
// //           FloatingActionButton.extended(
// //             onPressed: () async {
// //               //_downloadContract(_studentsData);
// //             },
// //             label: Text('Download Contract'),
// //             icon: Icon(Icons.file_download),
// //             backgroundColor: Colors.blue,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //   }
// //
// //
// //   Widget dataItems2({required Map course}) {
// //     return Container(
// //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
// //       padding: EdgeInsets.all(20),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(20),
// //         color: Colors.white,
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.5),
// //             spreadRadius: 2,
// //             blurRadius: 5,
// //             offset: Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             '${course['firstName'] ?? ''} ${course['middleName'] ?? ''} ${course['lastName'] ?? ''}',
// //             style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.black,
// //             ),
// //           ),
// //           SizedBox(height: 15),
// //
// //           _buildInfoRow(label: 'Course length', value: course['courseLength1'] ?? ''),
// //           _buildInfoRow(label: 'Phone Number', value: course['courseLength2'] ?? ''),
// //           // _buildInfoRow(
// //           //   label: 'Address',
// //           //   value: '${students['streetAddress'] ?? ''}, ${students['city'] ?? ''}, ${students['state'] ?? ''}, ${students['zipCode'] ?? ''}',
// //           // ),
// //           // _buildInfoRow(label: 'High School', value: students['highSchool'] ?? ''),
// //           // _buildInfoRow(label: 'Student Phone #', value: students['studentPhoneNumber'] ?? ''),
// //           // _buildInfoRow(label: 'Mother Phone #', value: students['motherPhoneNumber'] ?? ''),
// //           _buildInfoRow(label: 'Course rate #', value: course['courseRate'] ?? ''),
// //           SizedBox(height: 20),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateData(studentKey: course['key'])));
// //                 },
// //                 child: Icon(
// //                   Icons.edit,
// //                   color: Theme.of(context).primaryColor,
// //                   size: 30,
// //                 ),
// //               ),
// //               SizedBox(width: 20),
// //               GestureDetector(
// //                 onTap: () {
// //                 //  reference.child(students['key']).remove();
// //                 },
// //                 child: Icon(
// //                   Icons.delete,
// //                   color: Colors.red[700],
// //                   size: 30,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInfoRow({required String label, required String value}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 5),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             '$label: ',
// //             style: TextStyle(
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.grey[800],
// //             ),
// //           ),
// //           SizedBox(width: 5),
// //           Expanded(
// //             child: Text(
// //               value,
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 color: Colors.grey[800],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //
// // }

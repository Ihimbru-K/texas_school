
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen2.dart';

class PersonalInfoPage extends StatefulWidget {




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




  // final String lessons;
  // final String courseLength;
  // final String lessonLength;
  // final String costPerLesson;
  final String roadTestPkg;
  final String totalAmount;
  final String administrativeExpense;
  //final String courseRate;
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
  // final String lessons1;
  // final String courseLength1;
  // final String lessonLength1;
  // final String lessonCost1;
  // final String lessons2;
  // final String courseLength2;
  // final String lessonLength2;
  // final String lessonCost2;
  // final String courseRate1;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String makeupAssignment;

  final int noShowFeeAmount;
  final int noShowFeeNoticePeriod;
  final int latePolicyWaitingTime;
  final int propertyDamageFeeAmount;
  final int gasPriceLimit;
  final int fuelSurchargeAmount;













  //final String representativeName;
  final Uint8List? representativeInitials;
  final Uint8List? representativeSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartDate;
  final String classroomInstructionEndDate;
  final String makeupAssignmentDate;
  final String parentName;
  final Uint8List? parentInitials;
  final Uint8List? parentSignature;
  final DateTime parentSigningDate;
  final Uint8List? initials;
  final Uint8List? signature;

  PersonalInfoPage({
    required this.representativeName,
    required this.representativeInitials,
    required this.representativeSignature,
    required this.selectedDate,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
    required this.makeupAssignmentDate,
    required this.parentName,
    required this.parentInitials,
    required this.parentSignature,
    required this.parentSigningDate,
    required this.initials,
    required this.signature,required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense,required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate1, this.repInitials, this.repSignature, required this.classroomInstructionStartTime, required this.classroomInstructionEndTime, required this.makeupAssignment, required this.noShowFeeAmount, required this.noShowFeeNoticePeriod, required this.latePolicyWaitingTime, required this.propertyDamageFeeAmount, required this.gasPriceLimit, required this.fuelSurchargeAmount, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2, required this.lessons4, required this.courseLength4, required this.lessonLength4, required this.costPerLesson4, required this.courseRate3,
  });

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();

  String? selectedGender;
  String? selectedDate;
  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          title: Text('Personal Information'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: middleNameController,
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = formatDate(value);
                        });
                      }
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: TextEditingController(text: selectedDate ?? ''),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  items: ['Male', 'Female', 'Prefer not to say']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
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
                        final firstName = firstNameController.text;
                        final middleName = middleNameController.text;
                        final lastName = lastNameController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressInfoPage(

                              lessons1: widget.lessons1,
                              courseLength1: widget.courseLength1,
                              lessonLength1: widget.lessonLength1,
                              lessonCost1: widget.lessonCost1,

                              lessons2: widget.lessons2,
                              courseLength2: widget.courseLength2,
                              lessonLength2: widget.lessonLength2,
                              lessonCost2: widget.lessonCost2,
                              courseRate1: widget.courseRate1,

                              lessons3: widget.lessons3,
                              courseLength3: widget.courseLength3,
                              lessonLength3: widget.lessonLength3,
                              lessonCost3: widget.lessonCost3,
                              courseRate2: widget.courseRate2,


                              lessons4 : widget.lessons4,
                              courseLength4: widget.courseLength4,
                              lessonLength4: widget.lessonLength4,
                              costPerLesson4: widget.costPerLesson4,
                              courseRate3: widget.courseRate3,




                              // lessons: widget.lessons,
                              // courseLength: widget.courseLength,
                              // lessonLength: widget.lessonLength,
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
                              signature: widget.signature, noShowFeeAmount:  60, noShowFeeNoticePeriod: 24, latePolicyWaitingTime: 5, propertyDamageFeeAmount: 50, gasPriceLimit: 0, fuelSurchargeAmount: 0,

                              firstName: firstName,
                              middleName: middleName,
                              lastName: lastName,
                              dateOfBirth: selectedDate,
                              gender: selectedGender,
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
























// import 'package:flutter/material.dart';
// import 'package:form/ui/screen2.dart';
//  // Import your AddressInfoPage if it's in a separate file
//
// class PersonalInfoPage extends StatefulWidget {
//   @override
//   _PersonalInfoPageState createState() => _PersonalInfoPageState();
// }
//
//
// class _PersonalInfoPageState extends State<PersonalInfoPage> {
//   final firstNameController = TextEditingController();
//   final middleNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//
//   String? selectedGender;
//   String? selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         centerTitle: true,
//         title: Text('Personal Information'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextField(
//                 controller: middleNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Middle Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextField(
//                 controller: lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextFormField(
//                 onTap: () {
//                   showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   ).then((value) {
//                     if (value != null) {
//                       setState(() {
//                         selectedDate = value.toString();
//                       });
//                     }
//                   });
//                 },
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: 'Date Of Birth',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 controller: TextEditingController(text: selectedDate ?? ''),
//               ),
//               SizedBox(height: 10.0),
//               DropdownButtonFormField<String>(
//                 value: selectedGender,
//                 items: ['Male', 'Female', 'Prefer not to say']
//                     .map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedGender = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0), // Add space here instead of using Spacer
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Prev'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       final firstName = firstNameController.text;
//                       final middleName = middleNameController.text;
//                       final lastName = lastNameController.text;
//
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddressInfoPage(
//                             firstName: firstName,
//                             middleName: middleName,
//                             lastName: lastName,
//                             dateOfBirth: selectedDate,
//                             gender: selectedGender,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text('Next'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )
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
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:form/ui/screen2.dart';
// //
// // class PersonalInfoPage extends StatefulWidget {
// //   @override
// //   _PersonalInfoPageState createState() => _PersonalInfoPageState();
// // }
// //
// // class _PersonalInfoPageState extends State<PersonalInfoPage> {
// //   /// Creating textfield controllers for this page
// //   ///
// //   final firstNameController = TextEditingController();
// //   final middleNameController = TextEditingController();
// //   final lastNameController = TextEditingController();
// //
// //   String? selectedGender;
// //   String? selectedDate;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: Text('Personal Information'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextField(
// //               controller: firstNameController,
// //               decoration: InputDecoration(
// //                 labelText: 'First Name',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextField(
// //               controller: middleNameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Middle Name',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextField(
// //               controller: lastNameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Last Name',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextFormField(
// //               onTap: () {
// //                 showDatePicker(
// //                   context: context,
// //                   initialDate: DateTime.now(),
// //                   firstDate: DateTime(1900),
// //                   lastDate: DateTime.now(),
// //                 ).then((value) {
// //                   if (value != null) {
// //                     setState(() {
// //                       selectedDate = value.toString();
// //                     });
// //                   }
// //                 });
// //               },
// //               readOnly: true,
// //               decoration: InputDecoration(
// //                 labelText: 'Date Of Birth',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //               controller: TextEditingController(text: selectedDate ?? ''),
// //             ),
// //             SizedBox(height: 10.0),
// //             DropdownButtonFormField<String>(
// //               value: selectedGender,
// //               items: ['Male', 'Female', 'Prefer not to say']
// //                   .map((String value) {
// //                 return DropdownMenuItem<String>(
// //                   value: value,
// //                   child: Text(value),
// //                 );
// //               }).toList(),
// //               decoration: InputDecoration(
// //                 labelText: 'Gender',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //               onChanged: (String? value) {
// //                 setState(() {
// //                   selectedGender = value;
// //                 });
// //               },
// //             ),
// //             Spacer(),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Text('Prev'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     // Extract the values of date and selected gender here
// //                     final firstName = firstNameController.text;
// //                     final middleName = middleNameController.text;
// //                     final lastName = lastNameController.text;
// //
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => AddressInfoPage(
// //                           firstName: firstName,
// //                           middleName: middleName,
// //                           lastName: lastName,
// //                           dateOfBirth: selectedDate,
// //                           gender: selectedGender,
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Text('Next'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //


import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen2.dart';

class PersonalInfoPage extends StatefulWidget {
  final String representativeName;
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
    required this.signature,
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
                          selectedDate = value.toString();
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
                              representativeName: widget.representativeName,
                              representativeInitials: widget.representativeInitials,
                              representativeSignature: widget.representativeSignature,
                              selectedDate: widget.selectedDate,
                              classroomInstructionStartDate: widget.classroomInstructionStartDate,
                              classroomInstructionEndDate: widget.classroomInstructionEndDate,
                              makeupAssignmentDate: widget.makeupAssignmentDate,
                              parentName: widget.parentName,
                              parentInitials: widget.parentInitials,
                              parentSignature: widget.parentSignature,
                              parentSigningDate: widget.parentSigningDate,
                              initials: widget.initials,
                              signature: widget.signature,
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

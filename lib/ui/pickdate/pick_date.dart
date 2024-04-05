// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:form/ui/screen7.dart';
// import 'package:intl/intl.dart'; // Import the date formatting package
// import 'package:signature/signature.dart';
//
// class SchoolRepresentative extends StatefulWidget {
//   const SchoolRepresentative({Key? key}) : super(key: key);
//
//   @override
//   State<SchoolRepresentative> createState() => _SchoolRepresentativeState();
// }
//
// class _SchoolRepresentativeState extends State<SchoolRepresentative> {
//   final TextEditingController _representativeNameController =
//   TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _classroomInstructionStartController =
//   TextEditingController();
//   final TextEditingController _classroomInstructionEndController =
//   TextEditingController();
//   final TextEditingController _classroomInstructionStartTimeController =
//   TextEditingController(); // Added text controller for start time
//   final TextEditingController _classroomInstructionEndTimeController =
//   TextEditingController(); // Added text controller for end time
//   final TextEditingController _makeupAssignmentDeadlineController =
//   TextEditingController();
//   final SignatureController _initialsController = SignatureController(
//     penStrokeWidth: 5,
//     penColor: Colors.blue,
//     exportBackgroundColor: Colors.white,
//   );
//   final SignatureController _signatureController = SignatureController(
//     penStrokeWidth: 5,
//     penColor: Colors.red,
//     exportBackgroundColor: Colors.white,
//   );
//
//   late DateTime _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _dateController.text = DateFormat('MM/dd/yy').format(_selectedDate);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("School Representative"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: _representativeNameController,
//               decoration: InputDecoration(
//                 labelText: 'School Representative\'s name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 _selectDate(context, _dateController);
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     labelText: 'Signing Date (MM/DD/YY)',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 _selectDate(
//                     context, _classroomInstructionStartController);
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _classroomInstructionStartController,
//                   decoration: InputDecoration(
//                     labelText: 'Classroom Instruction Start Date',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 _selectDate(
//                     context, _classroomInstructionEndController);
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _classroomInstructionEndController,
//                   decoration: InputDecoration(
//                     labelText: 'Classroom Instruction End Date',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // New text field for Classroom Instruction Start Time
//             GestureDetector(
//               onTap: () async {
//                 TimeOfDay? time = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );
//                 if (time != null) {
//                   setState(() {
//                     _classroomInstructionStartTimeController.text =
//                         time.format(context);
//                   });
//                 }
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _classroomInstructionStartTimeController,
//                   decoration: InputDecoration(
//                     labelText: 'Classroom Instruction Start Time',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // New text field for Classroom Instruction End Time
//             GestureDetector(
//               onTap: () async {
//                 TimeOfDay? time = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );
//                 if (time != null) {
//                   setState(() {
//                     _classroomInstructionEndTimeController.text =
//                         time.format(context);
//                   });
//                 }
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _classroomInstructionEndTimeController,
//                   decoration: InputDecoration(
//                     labelText: 'Classroom Instruction End Time',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 _selectDate(
//                     context, _makeupAssignmentDeadlineController);
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _makeupAssignmentDeadlineController,
//                   decoration: InputDecoration(
//                     labelText: 'Makeup Assignment Deadline',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(height: 20),
//             Text('School Representative\'s Initials:'),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Signature(
//                 controller: _initialsController,
//                 height: 200,
//                 backgroundColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _initialsController.clear();
//               },
//               child: Text('Clear Initials'),
//             ),
//             SizedBox(height: 20),
//             Text('School Representative\'s Signature:'),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Signature(
//                 controller: _signatureController,
//                 height: 200,
//                 backgroundColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _signatureController.clear();
//               },
//               child: Text('Clear Signature'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 // Save signatures
//                 final Uint8List? initialsBytes =
//                 await _initialsController.toPngBytes();
//                 final Uint8List? signatureBytes =
//                 await _signatureController.toPngBytes();
//                 // Navigate to the next screen with the signature data
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => RepresentativeDisplayScreen(
//                       selectedDate: _selectedDate,
//                       representativeName: _representativeNameController.text,
//                       classroomInstructionStartTime:
//                       _classroomInstructionStartTimeController.text,
//                       classroomInstructionEndTime:
//                       _classroomInstructionEndTimeController.text,
//                       initials: initialsBytes,
//                       signature: signatureBytes,
//                     ),
//                   ),
//                 );
//               },
//               child: Text('Save Signatures'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _selectDate(BuildContext context,
//       TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       helpText: 'Select Date',
//       cancelText: 'Cancel',
//       confirmText: 'Select',
//       fieldLabelText: 'Select Date',
//       fieldHintText: 'MM/DD/YY',
//       errorFormatText: 'Invalid date',
//       errorInvalidText: 'Invalid date',
//       initialDatePickerMode: DatePickerMode.day,
//     );
//     if (picked != null) {
//       final DateFormat formatter = DateFormat('MM/dd/yy');
//       controller.text = formatter.format(picked);
//     }
//   }
// }

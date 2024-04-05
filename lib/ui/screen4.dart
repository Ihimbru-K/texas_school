
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:form/ui/screen5.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

class ParentInitials extends StatefulWidget {
  final String representativeName;
  final Uint8List? representativeInitials;
  final Uint8List? representativeSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartDate;
  final String classroomInstructionEndDate;
  final String makeupAssignmentDate;
  final Uint8List? initials;
  final Uint8List? signature;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String makeupAssingment;

  const ParentInitials({
    Key? key,
    required this.representativeName,
    required this.representativeInitials,
    required this.representativeSignature,
    required this.selectedDate,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
    required this.makeupAssignmentDate,
    required this.initials,
    required this.signature, required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,required this.makeupAssingment,
  }) : super(key: key);

  @override
  State<ParentInitials> createState() => _ParentInitialsState();
}

class _ParentInitialsState extends State<ParentInitials> {
  final TextEditingController _parentNameController = TextEditingController();
  final SignatureController _initialsController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.blue,
    exportBackgroundColor: Colors.white,
  );
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.white,
  );
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parent initials"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _parentNameController,
              decoration: InputDecoration(
                labelText: 'Parent\'s guardian name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Text('School Representative\'s Initials:'),
            // SizedBox(height: 10),
            // if (widget.representativeInitials != null)
            //   Image.memory(
            //     widget.representativeInitials!,
            //     width: 200,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            SizedBox(height: 20),
            Text('Parent\'s Initials:'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Signature(
                controller: _initialsController,
                height: 200,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _initialsController.clear();
              },
              child: Text('Clear Initials'),
            ),
            SizedBox(height: 20),
            Text('Parent\'s Signature:'),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Signature(
                controller: _signatureController,
                height: 200,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _signatureController.clear();
              },
              child: Text('Clear Signature'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Signing Date:'),
                SizedBox(width: 10),
                Text(
                  DateFormat('MM/dd/yy').format(_selectedDate),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _pickDate(context),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Uint8List? initialsBytes = await _initialsController.toPngBytes();
                final Uint8List? signatureBytes = await _signatureController.toPngBytes();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentDisplay(
                      initials: initialsBytes,
                      signature: signatureBytes,
                      parentName: _parentNameController.text,
                      parentInitials: initialsBytes,
                      parentSignature: signatureBytes,
                      parentSigningDate: _selectedDate,
                      representativeName: widget.representativeName,
                      representativeInitials: widget.representativeInitials,
                      representativeSignature: widget.representativeSignature,
                      selectedDate: widget.selectedDate,
                      classroomInstructionStartDate: widget.classroomInstructionStartDate,
                      classroomInstructionEndDate: widget.classroomInstructionEndDate,
                      makeupAssignmentDate: widget.makeupAssignmentDate,
                    ),
                  ),
                );
              },
              child: Text('Save Signatures'),
            ),
          ],
        ),
      ),
    );
  }
}















// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:form/ui/screen5.dart';
// import 'package:intl/intl.dart';
// import 'package:signature/signature.dart';
//
// class ParentInitials extends StatefulWidget {
//   const ParentInitials({Key? key}) : super(key: key);
//
//   @override
//   State<ParentInitials> createState() => _ParentInitialsState();
// }
//
// class _ParentInitialsState extends State<ParentInitials> {
//   final TextEditingController _parentNameController = TextEditingController();
//   final TextEditingController _signingDateController = TextEditingController();
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
//   late DateTime _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _signingDateController.text = DateFormat('MM/dd/yy').format(_selectedDate);
//   }
//
//   Future<void> _pickDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//         _signingDateController.text = DateFormat('MM/dd/yy').format(pickedDate);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Parent initials"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: _parentNameController,
//               decoration: InputDecoration(
//                 labelText: 'Parent\'s guardian name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Parent\'s Initials:'),
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
//             Text('Parent\'s Signature:'),
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
//             Row(
//               children: [
//                 Text('Signing Date:'),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     controller: _signingDateController,
//                     readOnly: true,
//                     onTap: () => _pickDate(context),
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
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
//                     builder: (context) => NextScreen(
//                       parentName: _parentNameController.text,
//                       initials: initialsBytes,
//                       signature: signatureBytes,
//                       signingDate: _selectedDate,
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
// }
//
//
//
// // import 'dart:typed_data';
// //
// // import 'package:flutter/material.dart';
// // import 'package:form/ui/screen5.dart';
// // import 'package:signature/signature.dart';
// //
// // class ParentInitials extends StatefulWidget {
// //   const ParentInitials({Key? key}) : super(key: key);
// //
// //   @override
// //   State<ParentInitials> createState() => _ParentInitialsState();
// // }
// //
// // class _ParentInitialsState extends State<ParentInitials> {
// //   final TextEditingController _parentNameController = TextEditingController();
// //   final SignatureController _initialsController = SignatureController(
// //     penStrokeWidth: 5,
// //     penColor: Colors.blue,
// //     exportBackgroundColor: Colors.white,
// //   );
// //   final SignatureController _signatureController = SignatureController(
// //     penStrokeWidth: 5,
// //     penColor: Colors.red,
// //     exportBackgroundColor: Colors.white,
// //   );
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Parent initials"),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(20),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _parentNameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Parent\'s guardian name',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text('Parent\'s Initials:'),
// //             Container(
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.black, width: 2),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Signature(
// //                 controller: _initialsController,
// //                 height: 200,
// //                 backgroundColor: Colors.white,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _initialsController.clear();
// //               },
// //               child: Text('Clear Initials'),
// //             ),
// //             SizedBox(height: 20),
// //             Text('Parent\'s Signature:'),
// //             Container(
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.black, width: 2),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Signature(
// //                 controller: _signatureController,
// //                 height: 200,
// //                 backgroundColor: Colors.white,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _signatureController.clear();
// //               },
// //               child: Text('Clear Signature'),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 // Save signatures
// //                 final Uint8List? initialsBytes =
// //                 await _initialsController.toPngBytes();
// //                 final Uint8List? signatureBytes =
// //                 await _signatureController.toPngBytes();
// //                 // Navigate to the next screen with the signature data
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => NextScreen(
// //                       parentName: _parentNameController.text,
// //                       initials: initialsBytes,
// //                       signature: signatureBytes,
// //                     ),
// //                   ),
// //                 );
// //               },
// //               child: Text('Save Signatures'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //

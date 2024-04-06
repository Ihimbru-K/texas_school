
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:form/ui/screen5.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

class ParentInitials extends StatefulWidget {
  final String lessons;
  final String courseLength;
  final String lessonLength;
  final String costPerLesson;
  final String roadTestPkg;
  final String totalAmount;
  final String administrativeExpense;
  final String courseRate;
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
  final String lessons1;
  final String courseLength1;
  final String lessonLength1;
  final String lessonCost1;
  final String lessons2;
  final String courseLength2;
  final String lessonLength2;
  final String lessonCost2;
  final String courseRate1;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartDate;
  final String classroomInstructionEndDate;
  final String makeupAssignment;
  final Uint8List? parentInitials;
  final Uint8List? parentSignature;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;

  final int noShowFeeAmount;
  final int noShowFeeNoticePeriod;
  final int latePolicyWaitingTime;
  final int propertyDamageFeeAmount;
  final int gasPriceLimit; // You can make it nullable if not always provided
  final int fuelSurchargeAmount; // You can make it nullable if not always provided

  //final String makeupAssignment;

  const ParentInitials({

    required this.representativeName,
    required this.repInitials,
    required this.repSignature,
    required this.selectedDate,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
    required this.makeupAssignment,
    required this.parentInitials,
    required this.parentSignature, required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,
    required this.lessons, required this.courseLength, required this.lessonLength, required this.costPerLesson, required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense, required this.courseRate, required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate1, required this.noShowFeeAmount, required this.noShowFeeNoticePeriod, required this.latePolicyWaitingTime, required this.propertyDamageFeeAmount, required this.gasPriceLimit, required this.fuelSurchargeAmount,
  }) ;

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

            //accessing data through a widget object
            Text(
              'A no-show fee of \$${widget.noShowFeeAmount} will be charged if the school is not notified of a cancellation at least ${widget.noShowFeeNoticePeriod} hours prior to a scheduled in-car lesson.\n'
                  'Instructor is only allowed to wait ${widget.latePolicyWaitingTime} minutes after scheduled time if student is late to drive a “No Show” fee will incur.\n'
                  'A fee of \$${widget.propertyDamageFeeAmount} will be charged if a student defaces or damages any school property (desks, tables, textbooks, etc.).\n'
                  'If gas prices exceed \$${widget.gasPriceLimit} per gallon, an additional fuel surcharge of \$${widget.fuelSurchargeAmount} will be charged for each driving lesson.',
            ),

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
                      representativeInitials: widget.repInitials,
                      representativeSignature: widget.repSignature,
                      selectedDate: widget.selectedDate,
                      classroomInstructionStartDate: widget.classroomInstructionStartDate,
                      classroomInstructionEndDate: widget.classroomInstructionEndDate,
                      makeupAssignmentDate: widget.makeupAssignment,
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


















import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/behind_the_wheel_only.dart';

class ClassRoomBehindTheWheel extends StatefulWidget {
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String classroomInstructionStartDate;
  final String makeupAssingment;
  final String classroomInstructionEndDate;

  ClassRoomBehindTheWheel({
    required this.representativeName,
    required this.repInitials,
    required this.repSignature,
    required this.selectedDate,
    required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,
    required this.classroomInstructionStartDate,
    required this.makeupAssingment,
    required this.classroomInstructionEndDate,
  });

  @override
  _ClassRoomBehindTheWheelState createState() => _ClassRoomBehindTheWheelState();
}

class _ClassRoomBehindTheWheelState extends State<ClassRoomBehindTheWheel> {
  TextEditingController lessons1Controller = TextEditingController(text: '16');
  TextEditingController courseLength1Controller = TextEditingController(text: '32 Hrs');
  TextEditingController lessonLength1Controller = TextEditingController(text: '2 Hrs');
  TextEditingController lessonCost1Controller = TextEditingController(text: '\$19.50');

  TextEditingController lessons2Controller = TextEditingController(text: '16');
  TextEditingController courseLength2Controller = TextEditingController(text: '32 Hrs');
  TextEditingController lessonLength2Controller = TextEditingController(text: '2 Hrs');
  //TextEditingController lessonCost2Controller = TextEditingController(text: '\$9.0');
  TextEditingController courseRateController = TextEditingController(text: '\$375');
  TextEditingController secondLessonCostController = TextEditingController(text: '\$9');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'CLASSROOM & BEHIND-THE-WHEEL INSTRUCTION – CONCURRENT COURSE (TEEN)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildInputField('Number of Lessons', lessons1Controller),
              _buildInputField('Length of Course', courseLength1Controller),
              _buildInputField('Length of Lesson', lessonLength1Controller),
              _buildInputField('Costs per Lesson', lessonCost1Controller),
              SizedBox(height: 30),
              Text(
                'CLASSROOM ONLY (TEEN)-PT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildInputField('Number of Lessons', lessons2Controller),
              _buildInputField('Length of Course', courseLength2Controller),
              _buildInputField('Length of Lesson', lessonLength2Controller),
              _buildInputField('Costs per Lesson', secondLessonCostController), // This line was corrected
              _buildInputField('Course Rate', courseRateController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen with the entered values
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BehindTheWheelOnly(
                        lessons1: lessons1Controller.text,
                        courseLength1: courseLength1Controller.text,
                        lessonLength1: lessonLength1Controller.text,
                        lessonCost1: lessonCost1Controller.text,
                        lessons2: lessons2Controller.text,
                        courseLength2: courseLength2Controller.text,
                        lessonLength2: lessonLength2Controller.text,
                        lessonCost2: secondLessonCostController.text,
                        courseRate: courseRateController.text,
                        representativeName: widget.representativeName,
                        repInitials: widget.repInitials,
                        repSignature: widget.repSignature,
                        selectedDate: widget.selectedDate,
                        classroomInstructionStartTime: widget.classroomInstructionStartTime,
                        classroomInstructionEndTime: widget.classroomInstructionEndTime,
                        classroomInstructionStartDate: widget.classroomInstructionStartDate,
                        makeupAssignment: widget.makeupAssingment,
                        classroomInstructionEndDate: widget.classroomInstructionEndDate,
                      ),
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}





























// final String representativeName;
// final String initials ;
// final String selectedDate;
// final String classroomInstructionsStartTime;
// final String classroomInstructionEndTime;
// final String classroomInstructionStartDate;
// final String makeupAssingment;
// final String classroomInstructionEndDate;
// final String signature;
// final String representativeInitials;
// final String representativeSignature;
// final String makeupAssignmentDate;
//
// ClassRoomBehindTheWheel({required this.makeupAssingment, required this.representativeName, required this.initials, required this.selectedDate, required this.classroomInstructionsStartTime, required this.classroomInstructionEndTime, required this.classroomInstructionEndDate, required this.representativeInitials, required this.representativeSignature, required this.makeupAssignmentDate, required this.classroomInstructionStartDate, required this.signature});
//
//
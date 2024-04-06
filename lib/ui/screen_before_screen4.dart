import 'dart:typed_data';

import 'package:flutter/material.dart';


class NecessaryInfo extends StatelessWidget {
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
  //final String courseRate;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String classroomInstructionStartDate;
  final String makeupAssignment;
  final String classroomInstructionEndDate;
  final String courseRate1;





  NecessaryInfo({
    required this.lessons1,
    required this.courseLength1,
    required this.lessonLength1,
    required this.lessonCost1,
    required this.lessons2,
    required this.courseLength2,
    required this.lessonLength2,
    required this.lessonCost2,
   // required this.courseRate,
    required this.representativeName,
    required this.repInitials,
    required this.repSignature,
    required this.selectedDate,
    required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,
    required this.classroomInstructionStartDate,
   // required this.makeupAssignment,
    required this.classroomInstructionEndDate,
    required this.lessons, required this.courseLength, required this.lessonLength,
    required this.costPerLesson, required this.roadTestPkg, required this.totalAmount,
    required this.administrativeExpense, required this.courseRate, required this.payment11,
    required this.date11, required this.payment12, required this.date12, required this.payment21,
    required this.date21, required this.payment22, required this.date22, required this.payment31,
    required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41,
    required this.payment42, required this.date42, required this.courseRate1, required this.makeupAssignment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'CLASSROOM & BEHIND-THE-WHEEL INSTRUCTION – CONCURRENT COURSE (TEEN)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Number of Lessons: $lessons1'),
              Text('Length of Course: $courseLength1'),
              Text('Length of Lesson: $lessonLength1'),
              Text('Costs per Lesson: $lessonCost1'),
              SizedBox(height: 20),
              Text(
                'CLASSROOM ONLY (TEEN)-PT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Number of Lessons: $lessons2'),
              Text('Length of Course: $courseLength2'),
              Text('Length of Lesson: $lessonLength2'),
              Text('Costs per Lesson: $lessonCost2'),
              Text('Course Rate: $courseRate'),
              SizedBox(height: 20),
              Text(
                'Additional Details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Representative Name: $representativeName'),
              Text('Selected Date: $selectedDate'),
              Text('Classroom Instruction Start Date: $classroomInstructionStartDate'),
              Text('Classroom Instruction Start Time: $classroomInstructionStartTime'),
              Text('Classroom Instruction End Time: $classroomInstructionEndTime'),
              Text('Classroom Instruction End Date: $classroomInstructionEndDate'),
              Text('Makeup Assignment Date: $makeupAssignment'),

              SizedBox(height: 20),






            ],
          ),
        ),
      ),
    );
  }

}
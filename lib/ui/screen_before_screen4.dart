import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen4.dart';


class NecessaryInfo extends StatelessWidget {
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
  //final String costPerLesson;
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
  //final String lessons1;
  // final String courseLength1;
  // final String lessonLength1;
  // final String lessonCost1;
  // final String lessons2;
  // final String courseLength2;
  // final String lessonLength2;
  // final String lessonCost2;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String classroomInstructionStartDate;
  final String makeupAssignment;
  final String classroomInstructionEndDate;
  // final String courseRate1;





  NecessaryInfo({
    required this.lessons1,
    required this.courseLength1,
    required this.lessonLength1,
    required this.lessonCost1,
    required this.lessons2,
    required this.courseLength2,
    required this.lessonLength2,
    required this.lessonCost2,
    required this.representativeName,
    required this.repInitials,
    required this.repSignature,
    required this.selectedDate,
    required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
   required this.roadTestPkg, required this.totalAmount,
    required this.administrativeExpense, required this.courseRate, required this.payment11,
    required this.date11, required this.payment12, required this.date12, required this.payment21,
    required this.date21, required this.payment22, required this.date22, required this.payment31,
    required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41,
    required this.payment42, required this.date42, required this.courseRate1, required this.makeupAssignment, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2, required this.lessons4, required this.courseLength4, required this.lessonLength4, required this.costPerLesson4, required this.courseRate3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Necessary costs for parent\'s review', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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

              Center(child:
              ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                  _submitForm3(context);
                },
                child: Text('Agree?'),
              ),)





            ],
          ),
        ),
      ),
    );
  }


  void _submitForm3(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ParentInitials(
      lessons1: lessons1,
      courseLength1: courseLength1,
      lessonLength1: lessonLength1,
      lessonCost1: lessonCost1,

      lessons2: lessons2,
      courseLength2: courseLength2,
      lessonLength2: lessonLength2,
      lessonCost2: lessonCost2,
      courseRate1: courseRate1,

      lessons3: lessons3,
      courseLength3: courseLength3,
      lessonLength3: lessonLength3,
      lessonCost3: lessonCost3,
      courseRate2: courseRate2,


      lessons4 : lessons4,
      courseLength4: courseLength4,
      lessonLength4: lessonLength4,
      costPerLesson4: costPerLesson4,
      courseRate3: courseRate3,



      // costPerLesson: costPerLesson,
      roadTestPkg: roadTestPkg,
      totalAmount:totalAmount,
      administrativeExpense: administrativeExpense,
      courseRate:courseRate,
      payment11: payment11,
      date11: date11,
      payment12:payment12,
      date12: date12,
      payment21: payment21,
      date21: date21,
      payment22: payment22,
      date22: date22,
      payment31: payment31,
      date31: date31,
      payment32: payment32,
      date32: date32,
      payment41: payment41,
      date41: date41,
      payment42: payment42,
      date42: date42,

      // lessons1: lessons1,
      // courseLength1: courseLength1,
      // lessonLength1: lessonLength1,
      // lessonCost1: lessonCost1,
      //
      //
      // lessons2: lessons2,
      // courseLength2: courseLength2,
      // lessonLength2: lessonLength2,
      // lessonCost2: lessonCost2,
      // courseRate1: courseRate1,

      
      representativeName: representativeName,
      repInitials: repInitials,
      repSignature: repSignature,
      selectedDate: selectedDate,
      classroomInstructionStartTime: classroomInstructionStartTime,
      classroomInstructionEndTime: classroomInstructionEndTime,
      classroomInstructionStartDate: classroomInstructionStartDate,
      makeupAssignment: makeupAssignment,
      classroomInstructionEndDate: classroomInstructionEndDate, parentInitials: null, parentSignature: null, noShowFeeAmount: 60, noShowFeeNoticePeriod: 24, latePolicyWaitingTime: 5, propertyDamageFeeAmount: 50, gasPriceLimit: 0, fuelSurchargeAmount: 0,


    ),),);




  }



}
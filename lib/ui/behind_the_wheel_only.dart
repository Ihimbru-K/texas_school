
import 'dart:typed_data';

import 'package:flutter/material.dart';

class BehindTheWheelOnly extends StatefulWidget {

  final String lessons1;
  final String courseLength1;
  final String lessonLength1;
  final String lessonCost1;
  final String lessons2;
  final String courseLength2;
  final String lessonLength2;
  final String lessonCost2;
  final String courseRate;
  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String classroomInstructionStartDate;
  final String makeupAssignment;
  final String classroomInstructionEndDate;

  BehindTheWheelOnly({required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2, required this.courseRate,
    required this.representativeName, this.repInitials, this.repSignature, required this.selectedDate, required this.classroomInstructionStartTime, required this.makeupAssignment, required this.classroomInstructionEndDate, required this.classroomInstructionEndTime, required this.classroomInstructionStartDate});













  @override
  _BehindTheWheelOnlyState createState() => _BehindTheWheelOnlyState();
}

class _BehindTheWheelOnlyState extends State<BehindTheWheelOnly> {
  TextEditingController lessonsController = TextEditingController(text: '1');
  TextEditingController courseLengthController = TextEditingController(text: '1');
  TextEditingController lessonLengthController = TextEditingController();
  TextEditingController costPerLessonController = TextEditingController(text: '\$45');
  TextEditingController roadTestPkgController = TextEditingController(text: '\$100');
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController administrativeExpenseController = TextEditingController(text: '\$50');
  TextEditingController courseRateController = TextEditingController();
  TextEditingController payment11Controller = TextEditingController();

  TextEditingController date11Controller = TextEditingController();
  TextEditingController payment12Controller = TextEditingController();
  TextEditingController date12Controller = TextEditingController();

  TextEditingController payment21Controller = TextEditingController();
  TextEditingController date21Controller = TextEditingController();

  TextEditingController payment22Controller = TextEditingController();
  TextEditingController date22Controller = TextEditingController();


  TextEditingController payment31Controller = TextEditingController();
  TextEditingController date31Controller = TextEditingController();

  TextEditingController payment32Controller = TextEditingController();
  TextEditingController date32Controller = TextEditingController();

  TextEditingController payment41Controller = TextEditingController();
  TextEditingController date41Controller = TextEditingController();
  TextEditingController payment42Controller = TextEditingController();
  TextEditingController date42Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'BEHIND-THE-WHEEL ONLY',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildInputField('Number of Lessons', lessonsController),
              _buildInputField('Length of Course (hours)', courseLengthController),
              _buildInputField('Length of Lesson (hours)', lessonLengthController),
              _buildInputField('Cost per Lesson', costPerLessonController),
              _buildInputField('Road Test PKG', roadTestPkgController),
              _buildInputField('Total Amount of Contract', totalAmountController),
              _buildInputField('Administrative Expense', administrativeExpenseController),
              _buildInputField('Course Rate', courseRateController),
              SizedBox(height: 20),
              Text(
                'Payment Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildPaymentRow(payment11Controller, date11Controller, payment22Controller, date22Controller),
              _buildPaymentRow(payment21Controller, date21Controller, payment32Controller, date32Controller),
              _buildPaymentRow(payment31Controller, date31Controller, payment42Controller, date42Controller),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                  _submitForm(context);
                },
                child: Text('Submit'),
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

  Widget _buildPaymentRow(TextEditingController paymentController1, TextEditingController dateController1, TextEditingController paymentController2, TextEditingController dateController2) {
    return Row(
      children: [
        Expanded(
          child: _buildInputField('Payment', paymentController1),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildInputField('Date', dateController1),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildInputField('Payment', paymentController2),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildInputField('Date', dateController2),
        ),
      ],
    );
  }

void _submitForm(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(

      lessons : lessonsController.text,
      courseLength: courseLengthController.text,
      lessonLength: lessonLengthController.text,
      costPerLesson: costPerLessonController.text,
      roadTestPkg: roadTestPkgController.text,
      totalAmount: totalAmountController.text,
      administrativeExpense: administrativeExpenseController.text,
      courseRate: courseRateController.text,
      payment11: payment11Controller.text,
      date11: date11Controller.text,
      payment12: payment12Controller.text,
      date12: date12Controller.text,
      payment21: payment21Controller.text,
      date21: date21Controller.text,
      payment22: payment22Controller.text,
      date22: date22Controller.text,
      payment31: payment31Controller.text,
      date31: date31Controller.text,
      payment32: payment32Controller.text,
      date32: date32Controller.text,
      payment41: payment41Controller.text,
      date41: date41Controller.text,
      payment42: payment42Controller.text,
      date42: date42Controller.text,
      lessons1: widget.lessons1,
      courseLength1: widget.courseLength1,
      lessonLength1: widget.lessonLength1,
      lessonCost1: widget.lessonCost1,
      lessons2: widget.lessons2,
      courseLength2: widget.courseLength2,
      lessonLength2: widget.lessonLength2,
      lessonCost2: widget.lessonCost2,
      courseRate1: widget.courseRate,
      representativeName: widget.representativeName,
      repInitials: widget.repInitials,
      repSignature: widget.repSignature,
      selectedDate: widget.selectedDate,
      classroomInstructionStartTime: widget.classroomInstructionStartTime,
      classroomInstructionEndTime: widget.classroomInstructionEndTime,
      classroomInstructionStartDate: widget.classroomInstructionStartDate,
      makeupAssignment: widget.makeupAssignment,
      classroomInstructionEndDate: widget.classroomInstructionEndDate,

      // lessons1: widget.lessons1,
      // courseLength: widget.courseLength1,
      // lessonLength1: widget.lessonLength1,
      // lessonCost1: widget.lessonCost1,
      // lessons: widget.lessons2,
      // courseLength2: widget.courseLength2,
      // 'lessonLength2': lessonLength2,
      // 'lessonCost2': lessonCost2,
      // 'courseRate': courseRate,
      // 'representativeName': representativeName,
      // 'repInitials': repInitials,
      // 'repSignature': repSignature,
      // 'selectedDate': selectedDate,
      // 'classroomInstructionStartTime': classroomInstructionStartTime,
      // 'classroomInstructionEndTime': classroomInstructionEndTime,
      // 'classroomInstructionStartDate': classroomInstructionStartDate,
      // 'makeupAssignment': makeupAssignment,
      // 'classroomInstructionEndDate': classroomInstructionEndDate,





    ),),);




}






}

class NextScreen extends StatelessWidget {
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
// final String lessons1;
// final String courseLength1;
// final String lessonLength1;
// final String lessonCost1;
// final String lessons2;
// final String courseLength2;
// final String lessonLength2;
// final String lessonCost2;
final String courseRate1;
final String representativeName;
final Uint8List? repInitials;
final Uint8List? repSignature;
final DateTime selectedDate;
final String classroomInstructionStartTime;
final String classroomInstructionEndTime;
final String classroomInstructionStartDate;
final String makeupAssignment;
final String classroomInstructionEndDate;






  NextScreen({ required this.lessons, required this.courseLength, required this.lessonLength, required this.costPerLesson, required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense, required this.courseRate, required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2,
    required this.lessonCost2, required this.representativeName, this.repInitials, this.repSignature, required this.selectedDate, required this.classroomInstructionStartTime, required this.classroomInstructionEndTime, required this.classroomInstructionStartDate, required this.makeupAssignment, required this.classroomInstructionEndDate, required this.courseRate1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Info for behind the wheel only'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'BEHIND-THE-WHEEL ONLY',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildScreenItems(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Go back to the previous screen
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildDataWidget(String label, String value) {
    return Padding(padding: EdgeInsets.only(left: 30),
child: Column(
  children: [
    Row(

      children: [
        Text(
          label + ":", style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value)
      ],



    ),
    SizedBox(height: 10,),
  ],
)
    );



}


  Widget _buildScreenItems(){

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        _buildDataWidget("Number of lessons", lessons),

        _buildDataWidget("Length of course (hours)", courseLength),
        _buildDataWidget("Length of lesson (hours", lessonLength),
        _buildDataWidget('Cost per Lesson', costPerLesson),
        _buildDataWidget('Road Test PKG', roadTestPkg),
        _buildDataWidget('Total Amount of Contract', totalAmount),
        _buildDataWidget('Administrative Expense', administrativeExpense),
        _buildDataWidget('Course Rate', courseRate),
        _buildDataWidget('Payment 1', payment11),
        _buildDataWidget('Date 1', date11),
        _buildDataWidget('Payment 2', payment12),
        _buildDataWidget('Date 2', date12),
        _buildDataWidget('Payment 2', payment21),
        _buildDataWidget('Date 2', date21),
        _buildDataWidget('Payment 2', payment22),
        _buildDataWidget('Date 2', date22),
        _buildDataWidget('Payment 3', payment31),
        _buildDataWidget('Date 3', date31),
        _buildDataWidget('Payment 3', payment32),
        _buildDataWidget('Date 3', date32),
        _buildDataWidget('Payment 4', payment41),
        _buildDataWidget('Date 4', date41),
        _buildDataWidget('Payment 4', payment42),
        _buildDataWidget('Date 4', date42),
        

        
        





      ],
    );



  }
}

















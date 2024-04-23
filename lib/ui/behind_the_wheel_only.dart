
//import 'dart:js';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen_before_screen4.dart';

class BehindTheWheelOnly extends StatefulWidget {

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


  final String representativeName;
  final Uint8List? repInitials;
  final Uint8List? repSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndTime;
  final String classroomInstructionStartDate;
  final String makeupAssignment;
  final String classroomInstructionEndDate;

  BehindTheWheelOnly({required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2, required this.lessonCost2,
    required this.representativeName, this.repInitials, this.repSignature, required this.selectedDate, required this.classroomInstructionStartTime, required this.makeupAssignment, required this.classroomInstructionEndDate, required this.classroomInstructionEndTime, required this.classroomInstructionStartDate, required this.courseRate1, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2});













  @override
  _BehindTheWheelOnlyState createState() => _BehindTheWheelOnlyState();
}

class _BehindTheWheelOnlyState extends State<BehindTheWheelOnly> {
  TextEditingController lessons4Controller = TextEditingController(text: '1');
  TextEditingController courseLength4Controller = TextEditingController(text: '1');
  TextEditingController lessonLength4Controller = TextEditingController();
  TextEditingController costPerLesson4Controller = TextEditingController(text: '\$45');




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
              _buildInputField('Number of Lessons', lessons4Controller),
              _buildInputField('Length of Course (hours)', courseLength4Controller),
              _buildInputField('Length of Lesson (hours)', lessonLength4Controller),
              _buildInputField('Cost per Lesson', costPerLesson4Controller),
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


      roadTestPkg: roadTestPkgController.text,
      totalAmount: totalAmountController.text,
      administrativeExpense: administrativeExpenseController.text,

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
      courseRate1: widget.courseRate1,

      lessons3: widget.lessons3,
      courseLength3: widget.courseLength3,
      lessonLength3: widget.lessonLength3,
      lessonCost3: widget.lessonCost3,
      courseRate2: widget.courseRate2,


      lessons4 : lessons4Controller.text,
      courseLength4: courseLength4Controller.text,
      lessonLength4: lessonLength4Controller.text,
      costPerLesson4: costPerLesson4Controller.text,
      courseRate3: courseRateController.text,





      representativeName: widget.representativeName,
      repInitials: widget.repInitials,
      repSignature: widget.repSignature,
      selectedDate: widget.selectedDate,
      classroomInstructionStartTime: widget.classroomInstructionStartTime,
      classroomInstructionEndTime: widget.classroomInstructionEndTime,
      classroomInstructionStartDate: widget.classroomInstructionStartDate,
      makeupAssignment: widget.makeupAssignment,
      classroomInstructionEndDate: widget.classroomInstructionEndDate,


    ),),);




}






}

class NextScreen extends StatelessWidget {


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



// final String lessonLength1;
// final String lessonCost1;
// final String lessons2;
// final String courseLength2;
// final String lessonLength2;


final String representativeName;
final Uint8List? repInitials;
final Uint8List? repSignature;
final DateTime selectedDate;
final String classroomInstructionStartTime;
final String classroomInstructionEndTime;
final String classroomInstructionStartDate;
final String makeupAssignment;
final String classroomInstructionEndDate;






  NextScreen({ required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense, required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42, required this.lessons1, required this.courseLength1, required this.lessonLength1, required this.lessonCost1, required this.lessons2, required this.courseLength2, required this.lessonLength2,
    required this.lessonCost2, required this.representativeName, this.repInitials, this.repSignature, required this.selectedDate, required this.classroomInstructionStartTime, required this.classroomInstructionEndTime, required this.classroomInstructionStartDate, required this.makeupAssignment, required this.classroomInstructionEndDate, required this.courseRate1, required this.lessons3, required this.courseLength3, required this.lessonLength3, required this.lessonCost3, required this.courseRate2, required this.lessons4, required this.courseLength4, required this.lessonLength4, required this.costPerLesson4, required this.courseRate3});

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

              Center(child:
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission here
                      _submitForm2(context);
                    },
                    child: Text('Submit'),
                  ),)

              // Center(child: ElevatedButton(
              //   onPressed: () {
              //     // Go back to the previous screen
              //     Navigator.pop(context);
              //   },
              //   child: Text('Go Back'),
              // ),)
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

        _buildDataWidget("Number of lessons behind the wheel only", lessons4),

        _buildDataWidget("Length of course (hours) behind the wheel only", courseLength4),
        _buildDataWidget("Length of lesson (hours) behind the whee", lessonLength4),
        _buildDataWidget('Cost per Lesson', costPerLesson4),
        _buildDataWidget('Road Test PKG', roadTestPkg),
        _buildDataWidget('Total Amount of Contract', totalAmount),
        _buildDataWidget('Administrative Expense', administrativeExpense),
        _buildDataWidget('Course Rate', courseRate3),
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
  void _submitForm2(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NecessaryInfo(

      // lessons : lessons,
      // courseLength: courseLength,
      // lessonLength: lessonLength,
      // costPerLesson: costPerLesson,
      // courseRate:courseRate,



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






      roadTestPkg: roadTestPkg,
      totalAmount:totalAmount,
      administrativeExpense: administrativeExpense,

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
      representativeName: representativeName,
      repInitials: repInitials,
      repSignature: repSignature,
      selectedDate: selectedDate,
      classroomInstructionStartTime: classroomInstructionStartTime,
      classroomInstructionEndTime: classroomInstructionEndTime,
      classroomInstructionStartDate: classroomInstructionStartDate,
      makeupAssignment: makeupAssignment,
      classroomInstructionEndDate: classroomInstructionEndDate,


    ),),);




  }







}

















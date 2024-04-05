
import 'package:flutter/material.dart';

class BehindTheWheelOnly extends StatefulWidget {
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

  NextScreen({ required this.lessons, required this.courseLength, required this.lessonLength, required this.costPerLesson, required this.roadTestPkg, required this.totalAmount, required this.administrativeExpense, required this.courseRate, required this.payment11, required this.date11, required this.payment12, required this.date12, required this.payment21, required this.date21, required this.payment22, required this.date22, required this.payment31, required this.date31, required this.payment32, required this.date32, required this.payment41, required this.date41, required this.payment42, required this.date42});

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

  // Widget _buildFormDataItems() {
  //   List<Widget> widgets = [];
  //   formData.forEach((key, value) {
  //     widgets.add(
  //       Padding(
  //         padding: EdgeInsets.symmetric(vertical: 4.0),
  //         child: Row(
  //           children: [
  //             Text(
  //               key + ': ',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             Text(value.toString()),
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: widgets,
  //   );
  // }
}

















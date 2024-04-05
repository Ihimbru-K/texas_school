


import 'package:flutter/material.dart';

class ClassRoomBehindTheWheel extends StatefulWidget {


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
                      builder: (context) => NextScreen(
                        lessons1: lessons1Controller.text,
                        courseLength1: courseLength1Controller.text,
                        lessonLength1: lessonLength1Controller.text,
                        lessonCost1: lessonCost1Controller.text,
                        lessons2: lessons2Controller.text,
                        courseLength2: courseLength2Controller.text,
                        lessonLength2: lessonLength2Controller.text,
                        lessonCost2: secondLessonCostController.text,
                        courseRate: courseRateController.text,
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

class NextScreen extends StatelessWidget {
  final String lessons1;
  final String courseLength1;
  final String lessonLength1;
  final String lessonCost1;
  final String lessons2;
  final String courseLength2;
  final String lessonLength2;
  final String lessonCost2;
  final String courseRate;

  NextScreen({
    required this.lessons1,
    required this.courseLength1,
    required this.lessonLength1,
    required this.lessonCost1,
    required this.lessons2,
    required this.courseLength2,
    required this.lessonLength2,
    required this.lessonCost2,
    required this.courseRate,
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
            ],
          ),
        ),
      ),
    );
  }
}














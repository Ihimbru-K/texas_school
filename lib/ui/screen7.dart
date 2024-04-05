import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:form/ui/classroom_behind_the_wheel.dart';
import 'package:form/ui/screen4.dart';
import 'package:intl/intl.dart';

class RepresentativeDisplayScreen extends StatelessWidget {
  final String representativeName;
  final Uint8List? initials;
  final String classroomInstructionStartDate;
  final String makeupAssingment;
  final String classroomInstructionStartTime;
  final String classroomInstructionEndDate;
  final String classroomInstructionEndTime;
  final Uint8List? signature;
  final DateTime selectedDate;

  RepresentativeDisplayScreen({
    required this.representativeName,
    required this.initials,
    required this.signature,
    required this.selectedDate,
    required this.classroomInstructionStartTime,
    required this.classroomInstructionEndTime,
    required this.classroomInstructionStartDate,
    required this.makeupAssingment,
    required this.classroomInstructionEndDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Representative Display'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'School Representative\'s Name: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    representativeName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Selected Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    DateFormat('MM/dd/yy').format(selectedDate),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Classroom Instruction Start Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    classroomInstructionStartDate,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Classroom Instruction Start Time: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    classroomInstructionStartTime,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Classroom Instruction End Time: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    classroomInstructionEndTime,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Classroom Instruction End Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    classroomInstructionEndDate,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Makeup Assignment Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    makeupAssingment,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (initials != null) ...[
                Text(
                  'School Representative\'s Initials: ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Center(child:  Image.memory(
                  initials!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),),
                SizedBox(height: 20),
              ],
              if (signature != null) ...[
                Text(
                  'School Representative\'s Signature: ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Center(
                  child:  Image.memory(
                    signature!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassRoomBehindTheWheel(
                          representativeName: representativeName,
                          repInitials: initials,
                          selectedDate: selectedDate,
                          classroomInstructionStartTime: classroomInstructionStartTime,
                          classroomInstructionEndTime: classroomInstructionEndTime,
                          classroomInstructionStartDate: classroomInstructionStartDate,
                          makeupAssingment: makeupAssingment,
                          classroomInstructionEndDate: classroomInstructionEndDate,
                          repSignature: signature,
                        ),
                      ),
                    );
                  },
                  child: Text('Agreed'),
                ),

              ],
            ],
          ),
        ),
      ),
    );
  }
}




















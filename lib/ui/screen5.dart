import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form/ui/screen1.dart';
import 'package:intl/intl.dart';
import 'package:form/ui/screen6.dart';

class ParentDisplay extends StatelessWidget {
  final String parentName;
  final Uint8List? parentInitials;
  final Uint8List? parentSignature;
  final DateTime parentSigningDate;
  final String representativeName;
  final Uint8List? representativeInitials;
  final Uint8List? representativeSignature;
  final DateTime selectedDate;
  final String classroomInstructionStartDate;
  final String classroomInstructionEndDate;
  final String makeupAssignmentDate;
  final Uint8List? initials;
  final Uint8List? signature;

  ParentDisplay({
    required this.parentName,
    required this.parentInitials,
    required this.parentSignature,
    required this.parentSigningDate,
    required this.representativeName,
    required this.representativeInitials,
    required this.representativeSignature,
    required this.selectedDate,
    required this.classroomInstructionStartDate,
    required this.classroomInstructionEndDate,
    required this.makeupAssignmentDate,
    required this.initials,
    required this.signature,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Parent\'s Name: $parentName'),
              SizedBox(height: 10),
              Text('Parent\'s Signature Date: ${DateFormat('MM/dd/yy').format(parentSigningDate)}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalInfoPage(
                        representativeName: representativeName,
                        representativeInitials: representativeInitials,
                        representativeSignature: representativeSignature,
                        selectedDate: selectedDate,
                        classroomInstructionStartDate: classroomInstructionStartDate,
                        classroomInstructionEndDate: classroomInstructionEndDate,
                        makeupAssignmentDate: makeupAssignmentDate,
                        parentName: parentName,
                        parentInitials: parentInitials,
                        parentSignature: parentSignature,
                        parentSigningDate: parentSigningDate,
                        initials: initials,
                        signature: signature,
                      ),
                    ),
                  );
                },
                child: Text('Save Signatures'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

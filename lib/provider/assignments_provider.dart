import 'package:flutter/material.dart';
import '../models/assignment.dart';

class AssignmentProvider with ChangeNotifier {
  List<Assignment> assignments = [];
  List<Assignment> doneAssignments = [];

  addAssignment(String assignmentName, assignmentDate) {
    assignments.add(Assignment(
        assignmentName:
            assignmentName == "" ? "Unnamed Assignment" : assignmentName,
        assignmentDate: assignmentDate,
        subAssignments: []));
    notifyListeners();
  }
}

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

  addSubAssignment(
      String assignmebtType, int assignmentIndex, SubAssignment subAssignment) {
    assignmebtType == "a"
        ? assignments[assignmentIndex].subAssignments!.add(subAssignment)
        : doneAssignments[assignmentIndex].subAssignments!.add(subAssignment);
    notifyListeners();
  }

  updateSubAssignment(
    String assignmebtType,
    int assignmentIndex,
    int subAssignmentIndex,
  ) {
    assignmebtType == "a"
        ? assignments[assignmentIndex]
                .subAssignments![subAssignmentIndex]
                .subAssignmentDone =
            !assignments[assignmentIndex]
                .subAssignments![subAssignmentIndex]
                .subAssignmentDone!
        : doneAssignments[assignmentIndex]
                .subAssignments![subAssignmentIndex]
                .subAssignmentDone =
            !doneAssignments[assignmentIndex]
                .subAssignments![subAssignmentIndex]
                .subAssignmentDone!;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:tick_tick_app/Back%20End/data_base.dart';
import 'package:tick_tick_app/constants.dart';
import '../models/assignment.dart';

class AssignmentProvider with ChangeNotifier {
  List<Assignment> assignments = [];
  List<SubAssignment> subAssignments = [];

  Future addAssignment(Assignment assignment) async {
    await DataBase.addData(constAssignmentTableName, {
      constAssignmentName: assignment.assignmentName!,
      constAssignmentDate: assignment.assignmentDate!,
      constAssignmentDone: assignment.assignmentDone == false ? 0 : 1,
      constAssignmentCategory: assignment.assignmentCategory!,
      constAssignmentDescreption: assignment.assignmentDescreption!
    });

    notifyListeners();
  }

  Future addSubAssignment(SubAssignment subAssignment) async {
    await DataBase.addData(constSubAssignmentTableName, {
      constSubAssignmentName: subAssignment.subAssignmentName!,
      constSubAssignmentDate: subAssignment.subAssignmentDate!,
      constSubAssignmentDone: subAssignment.subAssignmentDone == false ? 0 : 1,
      constAssignmentId: subAssignment.assignmentId!,
    });

    notifyListeners();
  }

  Future<void> loadData() async {
    final assignmentsData = await DataBase.loadAssigments();
    assignments = assignmentsData.map((i) => Assignment.fromJson(i)).toList();

    final subAssignmentsData = await DataBase.loadSubAssigments();
    subAssignments =
        subAssignmentsData.map((i) => SubAssignment.fromJson(i)).toList();

    notifyListeners();
  }

  Future<void> updateAssignment(Assignment assignment) async {
    assignment.assignmentDone = !assignment.assignmentDone!;
    final dataBase = await DataBase.database();
    await dataBase.update(
      constAssignmentTableName,
      {constAssignmentDone: assignment.assignmentDone == false ? 0 : 1},
      where: "id = ?",
      whereArgs: [assignment.id],
    );

    notifyListeners();
  }

  Future<void> updateSubAssignment(SubAssignment subAssignment) async {
    subAssignment.subAssignmentDone = !subAssignment.subAssignmentDone!;
    final dataBase = await DataBase.database();
    await dataBase.update(
      constSubAssignmentTableName,
      {
        constSubAssignmentDone: subAssignment.subAssignmentDone == false ? 0 : 1
      },
      where: "id = ?",
      whereArgs: [subAssignment.id],
    );

    notifyListeners();
  }

  deleteAssignment(int id) {
    DataBase.deleteById(constAssignmentTableName, 'id', id);

    notifyListeners();
  }

  deleteSubAssignment(int id) {
    DataBase.deleteById(constSubAssignmentTableName, 'id', id);

    notifyListeners();
  }
}

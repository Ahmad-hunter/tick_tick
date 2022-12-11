import 'package:tick_tick_app/constants.dart';

class Assignment {
  int? id;
  String? assignmentName;
  String? assignmentDate;
  bool? assignmentDone;
  String? assignmentDescreption;
  String? assignmentCategory;
  List<SubAssignment>? subAssignments;
  Assignment(
      {this.id,
      this.assignmentName,
      this.assignmentDate,
      this.assignmentDone,
      this.assignmentDescreption,
      this.assignmentCategory,
      this.subAssignments});

  Assignment.fromJson(Map<String, dynamic> json)
      : assignmentName = json[constAssignmentName],
        assignmentDate = json[constAssignmentDate],
        assignmentCategory = json[constAssignmentCategory],
        assignmentDone = json[constAssignmentDone] == 0 ? false : true,
        assignmentDescreption = json[constAssignmentDescreption],
        id = json['id'];
}

class SubAssignment {
  int? id;
  String? subAssignmentName;
  String? subAssignmentDate;
  int? assignmentId;
  bool? subAssignmentDone;

  SubAssignment(
      {this.id,
      this.subAssignmentName,
      this.subAssignmentDate,
      this.subAssignmentDone,
      this.assignmentId});
  SubAssignment.fromJson(Map<String, dynamic> json)
      : subAssignmentName = json[constSubAssignmentName],
        subAssignmentDate = json[constSubAssignmentDate],
        subAssignmentDone = json[constSubAssignmentDone] == 0 ? false : true,
        assignmentId = json[constAssignmentId],
        id = json['id'];
}

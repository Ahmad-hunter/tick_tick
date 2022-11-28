class Assignment {
  String? assignmentName;
  String? assignmentDate;
  bool? assignmentDone;
  String? assignmentDescreption;
  List<SubAssignment>? subAssignments;
  Assignment(
      {this.assignmentName,
      this.assignmentDate,
      this.assignmentDone,
      this.assignmentDescreption,
      this.subAssignments});
}

class SubAssignment {
  String? subAssignmentName;
  String? subAssignmentDate;
  bool? subAssignmentDone;

  SubAssignment(
      {this.subAssignmentName, this.subAssignmentDate, this.subAssignmentDone});
}

class AssignmentInfo {
  String? assignmentType;
  int? assignmentIndex;

  AssignmentInfo({
    this.assignmentType,
    this.assignmentIndex,
  });
}

class Assignment {
  String? assignmentName;
  String? assignmentDate;
  bool? assignmentDone;
  List<SubAssignment>? subAssignments;
  Assignment(
      {this.assignmentName,
      this.assignmentDate,
      this.assignmentDone,
      this.subAssignments});
}

class SubAssignment {
  String? subAssignmentName;
  String? subAssignmentDate;
  bool? subAssignmentDone;

  SubAssignment(
      {this.subAssignmentName, this.subAssignmentDate, this.subAssignmentDone});
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/assignment.dart';
import '../provider/assignments_provider.dart';

class SubAssignmentsScreen extends StatefulWidget {
  const SubAssignmentsScreen({super.key});

  @override
  State<SubAssignmentsScreen> createState() => _SubAssignmentsScreenState();
}

class _SubAssignmentsScreenState extends State<SubAssignmentsScreen> {
  String? subTaskName = "";
  String? subAssignmentDate;
  @override
  Widget build(BuildContext context) {
    final AssignmentInfo assignmentInfo =
        ModalRoute.of(context)!.settings.arguments as AssignmentInfo;

    return Consumer<AssignmentProvider>(builder: ((context, provider, child) {
      final TextEditingController controller = TextEditingController();

      List<SubAssignment>? subAssignments = assignmentInfo.assignmentType == "a"
          ? provider.assignments[assignmentInfo.assignmentIndex!.toInt()]
              .subAssignments
          : provider.doneAssignments[assignmentInfo.assignmentIndex!.toInt()]
              .subAssignments;

      String title = assignmentInfo.assignmentType == "a"
          ? provider.assignments[assignmentInfo.assignmentIndex!.toInt()]
              .assignmentName!
          : provider.doneAssignments[assignmentInfo.assignmentIndex!.toInt()]
              .assignmentName!;

      subAssignmentDate ??= DateFormat('yyyy-MM-dd').format(DateTime.now());

      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Assignment info"),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "SubAssignments of $title",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 150,
                        child: TextField(
                          controller: controller,
                          onChanged: (value) {
                            subTaskName = value;
                          },
                          decoration:
                              const InputDecoration(hintText: "Subtask Name"),
                        )),
                    Row(
                      children: [
                        Text(subAssignmentDate!),
                        IconButton(
                          onPressed: (() async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            setState(() {
                              subAssignmentDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate!);
                            });
                          }),
                          icon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: (() {
                          controller.clear();
                          FocusScope.of(context).unfocus();
                          SubAssignment subAssignment = SubAssignment(
                              subAssignmentName: subTaskName == ""
                                  ? "unnamed task"
                                  : subTaskName,
                              subAssignmentDate: subAssignmentDate,
                              subAssignmentDone: false);
                          provider.addSubAssignment(
                              assignmentInfo.assignmentType.toString(),
                              assignmentInfo.assignmentIndex!.toInt(),
                              subAssignment);
                        }),
                        icon: const Icon(Icons.send_outlined))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: assignmentInfo.assignmentType == "a"
                        ? provider.assignments[assignmentInfo.assignmentIndex!]
                            .subAssignments?.length
                        : provider
                            .doneAssignments[assignmentInfo.assignmentIndex!]
                            .subAssignments
                            ?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: IconButton(
                              icon: const Icon(Icons.check_box),
                              onPressed: () {
                                provider.updateSubAssignment(
                                    assignmentInfo.assignmentType.toString(),
                                    assignmentInfo.assignmentIndex!.toInt(),
                                    index);
                              },
                              color: subAssignments?[index].subAssignmentDone ==
                                      false
                                  ? const Color.fromARGB(255, 0, 8, 12)
                                  : const Color.fromARGB(255, 156, 168, 173)),
                          trailing: Text(
                            subAssignments![index].subAssignmentDate.toString(),
                            style: TextStyle(
                                color: subAssignments[index]
                                            .subAssignmentDone ==
                                        false
                                    ? const Color.fromARGB(255, 209, 37, 6)
                                    : const Color.fromARGB(255, 156, 168, 173)),
                          ),
                          title: Text(
                            subAssignments[index].subAssignmentName.toString(),
                            style: TextStyle(
                                color: subAssignments[index]
                                            .subAssignmentDone ==
                                        false
                                    ? const Color.fromARGB(255, 0, 8, 12)
                                    : const Color.fromARGB(255, 156, 168, 173)),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}

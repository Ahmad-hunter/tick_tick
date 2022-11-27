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
  String? subTaskDate;
  @override
  Widget build(BuildContext context) {
    final assignmentIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<AssignmentProvider>(builder: ((context, provider, child) {
      final TextEditingController controller = TextEditingController();

      subTaskDate ??= DateFormat('yyyy-MM-dd').format(DateTime.now());
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(provider.assignments.length.toString()),
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
                  "Subtasks of ${provider.assignments[assignmentIndex].assignmentName!}",
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
                          onChanged: (value) {
                            subTaskName = value;
                          },
                          decoration:
                              const InputDecoration(hintText: "Subtask Name"),
                        )),
                    Row(
                      children: [
                        Text(subTaskDate!),
                        IconButton(
                          onPressed: (() async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            setState(() {
                              subTaskDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate!);
                            });
                          }),
                          icon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: (() {
                          FocusScope.of(context).unfocus();
                          controller.clear();
                          setState(() {
                            provider
                                .assignments[assignmentIndex].subAssignments!
                                .add(SubAssignment(
                                    subAssignmentName: subTaskName == ""
                                        ? "unnamed task"
                                        : subTaskName,
                                    subAssignmentDate: subTaskDate,
                                    subAssignmentDone: false));
                          });
                        }),
                        icon: const Icon(Icons.add_box))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: provider
                        .assignments[assignmentIndex].subAssignments?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: IconButton(
                              icon: const Icon(Icons.check_box),
                              onPressed: () {
                                setState(() {
                                  provider
                                          .assignments[assignmentIndex]
                                          .subAssignments?[index]
                                          .subAssignmentDone =
                                      !provider
                                          .assignments[assignmentIndex]
                                          .subAssignments![index]
                                          .subAssignmentDone!;
                                });
                              },
                              color: provider
                                          .assignments[assignmentIndex]
                                          .subAssignments?[index]
                                          .subAssignmentDone ==
                                      false
                                  ? const Color.fromARGB(255, 0, 8, 12)
                                  : const Color.fromARGB(255, 156, 168, 173)),
                          trailing: Text(
                            (provider.assignments[assignmentIndex]
                                    .subAssignments?[index].subAssignmentDate)
                                .toString(),
                            style: TextStyle(
                                color: provider
                                            .assignments[assignmentIndex]
                                            .subAssignments?[index]
                                            .subAssignmentDone ==
                                        false
                                    ? const Color.fromARGB(255, 209, 37, 6)
                                    : const Color.fromARGB(255, 156, 168, 173)),
                          ),
                          title: Text(
                            (provider.assignments[assignmentIndex]
                                    .subAssignments?[index].subAssignmentName)
                                .toString(),
                            style: TextStyle(
                                color: provider
                                            .assignments[assignmentIndex]
                                            .subAssignments?[index]
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

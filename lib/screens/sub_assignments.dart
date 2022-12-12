import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/assignment.dart';
import '../Back End/assignments_provider.dart';

class SubAssignmentsScreen extends StatefulWidget {
  const SubAssignmentsScreen({super.key});

  @override
  State<SubAssignmentsScreen> createState() => _SubAssignmentsScreenState();
}

class _SubAssignmentsScreenState extends State<SubAssignmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final Assignment assignment =
        ModalRoute.of(context)!.settings.arguments as Assignment;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future:
            Provider.of<AssignmentProvider>(context, listen: false).loadData(),
        builder: (context, snapshot) {
          String? subTaskName = "";
          String? subAssignmentDate;
          return Consumer<AssignmentProvider>(
              builder: ((context, provider, child) {
            final TextEditingController controller = TextEditingController();

            List<SubAssignment> subAssignments = [];
            for (var i in provider.subAssignments) {
              if (i.assignmentId == assignment.id) {
                subAssignments.add(i);
              }
            }

            subAssignmentDate ??=
                DateFormat('yyyy-MM-dd').format(DateTime.now());

            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text("${assignment.assignmentName!} Details"),
              ),
              body: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                width: width - 20,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                          width: width,
                          child: TextFormField(
                            initialValue: assignment.assignmentDescreption,
                            onChanged: (value) {
                              assignment.assignmentDescreption = value;
                            },
                            decoration: const InputDecoration(
                                hintText: "Assignment Descreption"),
                          )),
                    ),
                    SizedBox(
                      height: 10,
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
                                decoration: const InputDecoration(
                                    hintText: "Subtask Name"),
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
                                    subAssignmentDate = DateFormat('yyyy-MM-dd')
                                        .format(pickedDate!);
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
                                        ? "SubAssignment"
                                        : subTaskName,
                                    assignmentId: assignment.id,
                                    subAssignmentDate: subAssignmentDate,
                                    subAssignmentDone: false);
                                provider.addSubAssignment(subAssignment);
                                setState(() {});
                              }),
                              icon: const Icon(Icons.send_outlined))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: subAssignments.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                onLongPress: () {
                                  deleteSubAssignment(
                                      subAssignments[index].id!);
                                },
                                leading: IconButton(
                                    icon:  Icon( subAssignments[index]
                                                .subAssignmentDone ==
                                            false
                                        ? Icons.check_box_outline_blank:Icons.check_box),
                                    onPressed: () {
                                      provider.updateSubAssignment(
                                          subAssignments[index]);
                                      setState(() {});
                                    },
                                    color: subAssignments[index]
                                                .subAssignmentDone ==
                                            false
                                        ? const Color.fromARGB(255, 0, 8, 12)
                                        : const Color.fromARGB(
                                            255, 156, 168, 173)),
                                trailing: Text(
                                  subAssignments[index]
                                      .subAssignmentDate
                                      .toString(),
                                  style: TextStyle(
                                      color: subAssignments[index]
                                                  .subAssignmentDone ==
                                              false
                                          ? const Color.fromARGB(
                                              255, 209, 37, 6)
                                          : const Color.fromARGB(
                                              255, 156, 168, 173)),
                                ),
                                title: Text(
                                  subAssignments[index]
                                      .subAssignmentName
                                      .toString(),
                                  style: TextStyle(
                                      color: subAssignments[index]
                                                  .subAssignmentDone ==
                                              false
                                          ? const Color.fromARGB(255, 0, 8, 12)
                                          : const Color.fromARGB(
                                              255, 156, 168, 173)),
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
        });
  }

  deleteSubAssignment(int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return Consumer<AssignmentProvider>(
              builder: (context, provider, child) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                color: Color.fromARGB(255, 85, 79, 79),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  width: MediaQuery.of(context).size.width - 20,
                  child: Container(
                    color: Colors.black,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DELETE ASSIGNMENT? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.deleteSubAssignment(id);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "YES",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Row(
                                  children: [
                                    Text(
                                      "NO",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tick_tick_app/provider/assignments_provider.dart';
import 'package:tick_tick_app/screens/sub_assignments.dart';

import '../models/assignment.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<AssignmentProvider>(builder: ((context, provider, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Inbox"),
          ),
          body: Container(
            color: Color.fromARGB(255, 156, 168, 173),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.white,
                    width: width,
                    height: 45 + (provider.assignments.length.toDouble() * 50),
                    child: Column(
                      children: [
                        const Text(
                          "Assignments",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: provider.assignments.length,
                              itemBuilder: (BuildContext context, int index) {
                                print(provider
                                    .assignments[index].subAssignments?.length);
                                return ListTile(
                                    onTap: () {
                                      AssignmentInfo assignmentInfo =
                                          AssignmentInfo();
                                      assignmentInfo.assignmentIndex = index;
                                      assignmentInfo.assignmentType = "a";
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SubAssignmentsScreen(),
                                          settings: RouteSettings(
                                            arguments: assignmentInfo,
                                          ),
                                        ),
                                      );
                                    },
                                    leading: IconButton(
                                      icon: const Icon(
                                          Icons.check_box_outline_blank),
                                      onPressed: () {
                                        provider.doneAssignments
                                            .add(provider.assignments[index]);
                                        provider.assignments.removeAt(index);
                                        setState(() {});
                                      },
                                    ),
                                    trailing: Text(
                                      provider
                                          .assignments[index].assignmentDate!,
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    ),
                                    title: Text(provider
                                        .assignments[index].assignmentName!));
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white,
                      width: width,
                      height: 45 +
                          (provider.doneAssignments.length.toDouble() * 50),
                      child: Column(
                        children: [
                          const Text(
                            "Completed",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: provider.doneAssignments.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    ListTile(
                                        onTap: () {
                                          AssignmentInfo assignmentInfo =
                                              AssignmentInfo();
                                          assignmentInfo.assignmentIndex =
                                              index;
                                          assignmentInfo.assignmentType = "c";
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SubAssignmentsScreen(),
                                              settings: RouteSettings(
                                                arguments: assignmentInfo,
                                              ),
                                            ),
                                          );
                                        },
                                        leading: IconButton(
                                            icon: const Icon(Icons.check_box),
                                            onPressed: () {
                                              provider.assignments.add(provider
                                                  .doneAssignments[index]);
                                              provider.doneAssignments
                                                  .removeAt(index);
                                              setState(() {});
                                            },
                                            color: const Color.fromARGB(
                                                255, 156, 168, 173)),
                                        trailing: Text(
                                          provider.doneAssignments[index]
                                              .assignmentDate!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 156, 168, 173)),
                                        ),
                                        title: Text(
                                          provider.doneAssignments[index]
                                              .assignmentName!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 156, 168, 173)),
                                        ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addAssignment();
            },
            tooltip: 'Add Assignment',
            child: const Icon(
              Icons.add,
            ),
          ));
    }));
  }

  addAssignment() {
    String? assignmentName = "";
    String? assignmentDate;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          assignmentDate ??= DateFormat('yyyy-MM-dd').format(DateTime.now());
          return Consumer<AssignmentProvider>(
              builder: (context, provider, child) {
            return StatefulBuilder(
              builder: (context, setState) => Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  color: const Color(0xff737373),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    width: MediaQuery.of(context).size.width - 20,
                    child: SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: TextField(
                              autofocus: true,
                              onChanged: (value) {
                                assignmentName = value;
                              },
                              decoration: const InputDecoration(
                                  hintText: "What would you like to do?"),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: (() async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));

                                        setState(() {
                                          assignmentDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate!);
                                        });
                                      }),
                                      icon: const Icon(Icons.date_range),
                                    ),
                                    SizedBox(
                                        width: 200,
                                        child: Text(assignmentDate!)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        iconSize: 30,
                                        color: Colors.blueAccent,
                                        onPressed: () {
                                          provider.addAssignment(
                                              assignmentName!, assignmentDate);

                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                            Icons.add_circle_outline_rounded)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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

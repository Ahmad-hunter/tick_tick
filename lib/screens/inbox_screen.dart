import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tick_tick_app/Back%20End/assignments_provider.dart';
import 'package:tick_tick_app/screens/sub_assignments.dart';
import '../models/assignment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future:
            Provider.of<AssignmentProvider>(context, listen: false).loadData(),
        builder: (context, snapshot) {
          return Consumer<AssignmentProvider>(
              builder: ((context, provider, child) {
            int assigmentsCount = 0;
            int completedAssigmentsCount = 0;
            for (var assigment in provider.assignments) {
              if (assigment.assignmentCategory == widget.title) {
                if (assigment.assignmentDone == false) {
                  assigmentsCount += 1;
                } else {
                  completedAssigmentsCount += 1;
                }
              }
            }

            return Scaffold(
                drawer: Drawer(
                  backgroundColor: Color.fromARGB(255, 150, 147, 147),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.person_pin,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Hiba badawi : ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.notification_important_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height - 100,
                        child: Expanded(
                          flex: 1,
                          child: ListView(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Today",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.today),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Today"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Inbox",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.inbox),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Inbox"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Work",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.work),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Work"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Personal",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.home),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Personal"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Sports",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.sports_basketball),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Sports"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Social",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.people),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Social"),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: ListTile(
                                title: Text(
                                  "Health Care",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(Icons.health_and_safety_outlined),
                                iconColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(title: "Health Care"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(widget.title),
                ),
                body: Container(
                  color: Color.fromARGB(255, 156, 168, 173),
                  height: height,
                  width: width,
                  child: assigmentsCount + completedAssigmentsCount == 0
                      ? const Center(
                          child: Text("No Assignments yet"),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Visibility(
                              visible: assigmentsCount == 0 ? false : true,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Colors.white,
                                  width: width,
                                  height:
                                      45 + (assigmentsCount.toDouble() * 50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Assignments",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: assigmentsCount,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<Assignment> assignments = [];
                                              for (var i
                                                  in provider.assignments) {
                                                if (i.assignmentCategory ==
                                                    widget.title) {
                                                  if (i.assignmentDone ==
                                                      false) {
                                                    assignments.add(i);
                                                  }
                                                }
                                              }

                                              return ListTile(
                                                  onLongPress: () =>
                                                      deleteAssignment(
                                                          assignments[index]
                                                              .id!),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SubAssignmentsScreen(),
                                                        settings: RouteSettings(
                                                          arguments:
                                                              assignments[
                                                                  index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  leading: IconButton(
                                                    icon: const Icon(Icons
                                                        .check_box_outline_blank),
                                                    onPressed: () {
                                                      print(assignments[index]
                                                          .assignmentName);
                                                      provider.updateAssignment(
                                                          assignments[index]);
                                                    },
                                                  ),
                                                  trailing: Text(
                                                    assignments[index]
                                                        .assignmentDate!,
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                  ),
                                                  title: Text(assignments[index]
                                                      .assignmentName!));
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  completedAssigmentsCount == 0 ? false : true,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Colors.white,
                                  width: width,
                                  height: 45 +
                                      (completedAssigmentsCount.toDouble() *
                                          50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Completed",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                          child: ListView.builder(
                                              itemCount:
                                                  completedAssigmentsCount,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                List<Assignment>
                                                    doneAssignments = [];
                                                for (var i
                                                    in provider.assignments) {
                                                  if (i.assignmentCategory ==
                                                      widget.title) {
                                                    if (i.assignmentDone ==
                                                        true) {
                                                      doneAssignments.add(i);
                                                    }
                                                  }
                                                }
                                                return ListTile(
                                                    onLongPress: () =>
                                                        deleteAssignment(
                                                            doneAssignments[
                                                                    index]
                                                                .id!),
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SubAssignmentsScreen(),
                                                          settings:
                                                              RouteSettings(
                                                            arguments:
                                                                doneAssignments[
                                                                    index],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    leading: IconButton(
                                                        icon: const Icon(
                                                            Icons.check_box),
                                                        onPressed: () {
                                                          provider
                                                              .updateAssignment(
                                                                  doneAssignments[
                                                                      index]);
                                                        },
                                                        color: const Color
                                                                .fromARGB(255,
                                                            156, 168, 173)),
                                                    trailing: Text(
                                                      doneAssignments[index]
                                                          .assignmentDate!,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              156,
                                                              168,
                                                              173)),
                                                    ),
                                                    title: Text(
                                                      doneAssignments[index]
                                                          .assignmentName!,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              156,
                                                              168,
                                                              173)),
                                                    ));
                                              })),
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
        });
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                IconButton(
                                    iconSize: 30,
                                    color: Colors.blueAccent,
                                    onPressed: () {
                                      provider.addAssignment(Assignment(
                                          assignmentName: assignmentName == ""
                                              ? "Assignment"
                                              : assignmentName,
                                          assignmentDate: assignmentDate,
                                          assignmentDescreption: "Descreption",
                                          assignmentCategory: widget.title,
                                          assignmentDone: false));
                                      super.setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.send_outlined)),
                                Row(
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

  deleteAssignment(int id) {
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
                                  provider.deleteAssignment(id);
                                  super.setState(() {});
                                  Navigator.pop(context);
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

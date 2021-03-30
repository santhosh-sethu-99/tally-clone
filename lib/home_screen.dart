import 'package:flutter/material.dart';
import 'package:tally/create_card_screen.dart';
import 'package:tally/database_helper.dart';
import 'package:tally/utils.dart';

import 'model.dart';

class HomeScreen extends StatefulWidget {
  final bool isCardsVisible;

  HomeScreen({this.isCardsVisible = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Task>> _taskList;
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          "TALLY",
          style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 5,
            // color: Theme.of(context).primaryColor,
          ),
        ),
        actionsIconTheme: IconThemeData(
            // color: Theme.of(context).primaryColor,
            ),
        actions: [
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.settings),
            // TODO: navigate to settings screen
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _taskList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: InkWell(
                            onLongPress: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'Are you sure you want to delete this task?'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Delete'),
                                        onPressed: () {
                                          DatabaseHelper.instance.deleteTask(
                                              snapshot.data[index].id);
                                          _updateTaskList();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 5000),
                              opacity: 1.0,
                              child: Container(
                                height: 200,
                                width: 200,
                                child: Card(
                                  color: stringToColor(
                                      snapshot.data[index].color ?? 'amber'),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // Task Name
                                      Text(
                                        snapshot.data[index].taskName
                                                .toUpperCase() ??
                                            '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      // Task Action
                                      if (snapshot.data[index].typeOfCount !=
                                          "Custom Value")
                                        InkWell(
                                          onDoubleTap: () {
                                            snapshot.data[index].count -=
                                                snapshot
                                                    .data[index].defaultCount;
                                            DatabaseHelper.instance.updateTask(
                                                snapshot.data[index]);
                                            _updateTaskList();
                                          },
                                          onTap: () {
                                            snapshot.data[index].count +=
                                                snapshot
                                                    .data[index].defaultCount;
                                            DatabaseHelper.instance.updateTask(
                                                snapshot.data[index]);
                                            _updateTaskList();
                                          },
                                          child: Text(
                                            snapshot.data[index].count
                                                .toString(),
                                            //     +
                                            // snapshot.data[index].defaultCount
                                            //     .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 70,
                                            ),
                                          ),
                                        ),
                                      if (snapshot.data[index].typeOfCount ==
                                          "Custom Value")
                                        InkWell(
                                          onTap: () {
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Enter A Value'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              _editingController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Enter a custom value",
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Ok'),
                                                      onPressed: () {
                                                        snapshot.data[index]
                                                                .count =
                                                            int.parse(
                                                                _editingController
                                                                    .text);
                                                        DatabaseHelper.instance
                                                            .updateTask(snapshot
                                                                .data[index]);
                                                        _updateTaskList();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            snapshot.data[index].count
                                                .toString(),
                                            //     +
                                            // snapshot.data[index].defaultCount
                                            //     .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 70,
                                            ),
                                          ),
                                        ),
                                      // Text(
                                      //   snapshot.data[index].resetDay ?? '',
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     letterSpacing: 2,
                                      //     fontStyle: FontStyle.normal,
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 25,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   snapshot.data[index].setTarget ?? '',
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     letterSpacing: 2,
                                      //     fontStyle: FontStyle.normal,
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 25,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   snapshot.data[index].typeOfCount ?? '',
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     letterSpacing: 2,
                                      //     fontStyle: FontStyle.normal,
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 25,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   snapshot.data[index].defaultCount ?? '',
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     letterSpacing: 2,
                                      //     fontStyle: FontStyle.normal,
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 25,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                // child: _buildTaskList(context),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => CreateCard(
                updateList: _updateTaskList,
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

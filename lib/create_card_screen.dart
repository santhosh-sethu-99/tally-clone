import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tally/database_helper.dart';

import 'constants.dart';
import 'model.dart';
import 'utils.dart';

class CreateCard extends StatefulWidget {
  final Function updateList;

  const CreateCard({this.updateList});

  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _countController = TextEditingController();
  String title = '';
  String _resetTally = 'DAY';
  String _activityLog = "Default Count";
  String _setTarget = "NO";
  List<String> _trackOn = [
    "SUN",
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
  ];
  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    _countController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CREATE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Column(
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'WHAT DO YOU WANT TO TALLY?',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: TextFormField(
                                      controller: _textEditingController,
                                      onChanged: (value) {
                                        title = value;
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.white70,
                                        hintText: "Coffee, Water, Workout etc.",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Reset Tally
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'RESET TALLY EVERY',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 6.0,
                                    runSpacing: 6.0,
                                    children: <Widget>[
                                      for (int index = 0;
                                          index < kResetTallyEvery.length;
                                          index++)
                                        InputChip(
                                          onPressed: () {
                                            _resetTally =
                                                kResetTallyEvery[index];
                                            setState(() {});
                                          },
                                          selected: _resetTally ==
                                                  kResetTallyEvery[index]
                                              ? true
                                              : false,
                                          labelPadding: EdgeInsets.all(2.0),
                                          label: Text(
                                            kResetTallyEvery[index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          backgroundColor: Colors.white38,
                                          elevation: 0.0,
                                          shadowColor: Colors.grey[60],
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Track On
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: Container(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Align(
                        //           alignment: Alignment.centerLeft,
                        //           child: Text(
                        //             'TRACK ON',
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           height: 10,
                        //         ),
                        //         Align(
                        //           alignment: Alignment.centerLeft,
                        //           child: Wrap(
                        //             spacing: 6.0,
                        //             runSpacing: 6.0,
                        //             children: <Widget>[
                        //               for (String key in kTrackOn.keys)
                        //                 InputChip(
                        //                   onPressed: () {
                        //                     if (!_trackOn
                        //                         .contains(kTrackOn[key])) {
                        //                       _trackOn.add(kTrackOn[key]);
                        //                     } else {
                        //                       _trackOn.remove(kTrackOn[key]);
                        //                     }
                        //                     setState(() {});
                        //                   },
                        //                   selected:
                        //                       _trackOn.contains(kTrackOn[key]),
                        //                   labelPadding: EdgeInsets.all(2.0),
                        //                   label: Text(
                        //                     kTrackOn[key],
                        //                     style: TextStyle(
                        //                       color: Colors.white,
                        //                       fontSize: 12,
                        //                     ),
                        //                   ),
                        //                   backgroundColor: Colors.white38,
                        //                   elevation: 0.0,
                        //                   shadowColor: Colors.grey[60],
                        //                   padding: EdgeInsets.all(8.0),
                        //                 ),
                        //             ],
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Log Activity Using
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'LOG ACTIVITY USING',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 6.0,
                                    runSpacing: 6.0,
                                    children: <Widget>[
                                      for (int index = 0;
                                          index < kValuType.length - 1;
                                          index++)
                                        InputChip(
                                          onPressed: () {
                                            _activityLog = kValuType[index];
                                            setState(() {});
                                          },
                                          selected:
                                              _activityLog == kValuType[index]
                                                  ? true
                                                  : false,
                                          labelPadding: EdgeInsets.all(2.0),
                                          label: Text(
                                            kValuType[index].toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          backgroundColor: Colors.white38,
                                          elevation: 0.0,
                                          shadowColor: Colors.grey[60],
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Default Count
                        if (_activityLog == "Default Count")
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'DEFAULT COUNT',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          300,
                                      decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: TextFormField(
                                          controller: _countController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            title = value;
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            fillColor: Colors.white70,
                                            hintText: "",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (_activityLog == "Default Count")
                          const SizedBox(
                            height: 10,
                          ),
                        // Set Target
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SET TARGET',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 6.0,
                                    runSpacing: 6.0,
                                    children: <Widget>[
                                      for (int index = 0;
                                          index < kTarget.length;
                                          index++)
                                        InputChip(
                                          onPressed: () {
                                            _setTarget = kTarget[index];
                                            setState(() {});
                                          },
                                          selected: _setTarget == kTarget[index]
                                              ? true
                                              : false,
                                          labelPadding: EdgeInsets.all(2.0),
                                          label: Text(
                                            kTarget[index].toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          backgroundColor: Colors.white38,
                                          elevation: 0.0,
                                          shadowColor: Colors.grey[60],
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Select Colour
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SELECT COLOUR',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  spacing: 25.0,
                                  runSpacing: 10.0,
                                  children: [
                                    for (int i = 0; i < kColors.length; i++)
                                      InkWell(
                                        onTap: () {
                                          _color = kColors[i];
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                            color: kColors[i],
                                            border: kColors[i] == _color
                                                ? Border.all(
                                                    color: Colors.black,
                                                    width: 3,
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_textEditingController.text.isNotEmpty)
                  Container(
                    color: Colors.amberAccent,
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Task task = Task(
                            taskName: _textEditingController.text,
                            count: 0,
                            resetDay: _resetTally,
                            setTarget: _setTarget,
                            typeOfCount: _activityLog,
                            defaultCount: int.parse(_countController.text),
                            color: colorToString(_color),
                          );
                          DatabaseHelper.instance.insertTask(task);
                          widget.updateList();
                          // print(_color.toString() as Color);
                          setState(() {});
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'CREATE CARD',
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 5,
                            fontSize: 15),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

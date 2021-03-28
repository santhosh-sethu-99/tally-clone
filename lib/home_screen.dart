// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tally/create_card_screen.dart';
import 'package:provider/provider.dart';
// import 'card.dart';
import 'constants.dart';
// import 'model.dart';

class HomeScreen extends StatefulWidget {
  final bool isCardsVisible;

  HomeScreen({this.isCardsVisible = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  },
                ),
                // child: _buildTaskList(context),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // TODO: create a new card
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => CreateCard(),
              ),
            );
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

// StreamBuilder<List<ItemList>> _buildTaskList(BuildContext context) {
//   final database = Provider.of<AppDatabase>(context);
//   return StreamBuilder(
//     stream: database.watchAllTasks(),
//     builder: (context, AsyncSnapshot<List<ItemList>> snapshot) {
//       final tasks = snapshot.data ?? List();

//       // return ListView.builder(
//       //   itemCount: tasks.length,
//       //   itemBuilder: (_, index) {
//       //     final itemTask = tasks[index];
//       //     return _buildListItem(itemTask, database);
//       //   },
//       // );
//       return GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: tasks.length,
//         itemBuilder: (BuildContext context, int index) {
//           final itemTask = tasks[index];
//           return _buildListItem(itemTask, database);
//         },
//       );
//     },
//   );
// }

// Widget _buildListItem(ItemList itemList, AppDatabase database) {
//   // return Slidable(
//   //   actionPane: SlidableDrawerActionPane(),
//   //   secondaryActions: <Widget>[
//   //     IconSlideAction(
//   //       caption: 'Delete',
//   //       color: Colors.red,
//   //       icon: Icons.delete,
//   //       onTap: () => database.deleteTask(itemTask),
//   //     )
//   //   ],
//   //   child: CheckboxListTile(
//   //     title: Text(itemTask.name),
//   //     subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
//   //     value: itemTask.completed,
//   //     onChanged: (newValue) {
//   //       database.updateTask(itemTask.copyWith(completed: newValue));
//   //     },
//   //   ),
//   // );

//   return Padding(
//     padding: const EdgeInsets.all(3),
//     child: InkWell(
//       onLongPress: () {
//         print("Long Press");
//       },
//       child: AnimatedOpacity(
//         duration: Duration(milliseconds: 5000),
//         opacity: 1.0,
//         child: Container(
//           height: 200,
//           width: 200,
//           child: Card(
//             color: Colors.amberAccent,
//             child: Column(
//               children: [
//                 Center(
//                   child: Text(itemList.taskName),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

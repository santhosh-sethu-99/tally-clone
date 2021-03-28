import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

part 'model.g.dart';

class ItemLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskName => text().withLength(min: 1)();
  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [ItemLists])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          ),
        );
  @override
  int get schemaVersion => 1;

  Future<List<ItemList>> getAllTasks() => select(itemLists).get();

  Stream<List<ItemList>> watchAllTasks() => select(itemLists).watch();

  Future insertTask(ItemList itemList) => into(itemLists).insert(itemList);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class ItemList extends DataClass implements Insertable<ItemList> {
  final int id;
  final String taskName;
  ItemList({@required this.id, @required this.taskName});
  factory ItemList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ItemList(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      taskName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_name']),
    );
  }
  factory ItemList.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ItemList(
      id: serializer.fromJson<int>(json['id']),
      taskName: serializer.fromJson<String>(json['taskName']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'taskName': serializer.toJson<String>(taskName),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<ItemList>>(bool nullToAbsent) {
    return ItemListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      taskName: taskName == null && nullToAbsent
          ? const Value.absent()
          : Value(taskName),
    ) as T;
  }

  ItemList copyWith({int id, String taskName}) => ItemList(
        id: id ?? this.id,
        taskName: taskName ?? this.taskName,
      );
  @override
  String toString() {
    return (StringBuffer('ItemList(')
          ..write('id: $id, ')
          ..write('taskName: $taskName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, taskName.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ItemList && other.id == id && other.taskName == taskName);
}

class ItemListsCompanion extends UpdateCompanion<ItemList> {
  final Value<int> id;
  final Value<String> taskName;
  const ItemListsCompanion({
    this.id = const Value.absent(),
    this.taskName = const Value.absent(),
  });
  ItemListsCompanion copyWith({Value<int> id, Value<String> taskName}) {
    return ItemListsCompanion(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
    );
  }
}

class $ItemListsTable extends ItemLists
    with TableInfo<$ItemListsTable, ItemList> {
  final GeneratedDatabase _db;
  final String _alias;
  $ItemListsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _taskNameMeta = const VerificationMeta('taskName');
  GeneratedTextColumn _taskName;
  @override
  GeneratedTextColumn get taskName => _taskName ??= _constructTaskName();
  GeneratedTextColumn _constructTaskName() {
    return GeneratedTextColumn('task_name', $tableName, false,
        minTextLength: 1);
  }

  @override
  List<GeneratedColumn> get $columns => [id, taskName];
  @override
  $ItemListsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'item_lists';
  @override
  final String actualTableName = 'item_lists';
  @override
  VerificationContext validateIntegrity(ItemListsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.taskName.present) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableValue(d.taskName.value, _taskNameMeta));
    } else if (taskName.isRequired && isInserting) {
      context.missing(_taskNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemList map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ItemList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ItemListsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.taskName.present) {
      map['task_name'] = Variable<String, StringType>(d.taskName.value);
    }
    return map;
  }

  @override
  $ItemListsTable createAlias(String alias) {
    return $ItemListsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ItemListsTable _itemLists;
  $ItemListsTable get itemLists => _itemLists ??= $ItemListsTable(this);
  @override
  List<TableInfo> get allTables => [itemLists];
}

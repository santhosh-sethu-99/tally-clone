class Task {
  int id;
  String taskName;

  Task({
    this.id,
    this.taskName,
  });
  Task.withId({
    this.id,
    this.taskName,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["taskName"] = taskName;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(id: map["id"], taskName: map["taskName"]);
  }
}

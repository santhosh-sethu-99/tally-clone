class Task {
  int id;
  String taskName;
  String resetDay;
  String setTarget;
  String typeOfCount;
  String defaultCount;
  String color;

  Task({
    this.id,
    this.taskName,
    this.resetDay,
    this.setTarget,
    this.typeOfCount,
    this.defaultCount,
    this.color,
  });
  Task.withId({
    this.id,
    this.taskName,
    this.resetDay,
    this.setTarget,
    this.typeOfCount,
    this.defaultCount,
    this.color,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["taskName"] = taskName;
    map["resetDay"] = resetDay;
    map["setTarget"] = setTarget;
    map["typeOfCount"] = typeOfCount;
    map["defaultCount"] = defaultCount;
    map["color"] = color;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map["id"],
      taskName: map["taskName"],
      resetDay: map["resetDay"],
      setTarget: map["setTarget"],
      typeOfCount: map["typeOfCount"],
      defaultCount: map["defaultCount"],
      color: map["color"],
    );
  }
}

class AddTaskModel {
  final int? id;
  final int taskStatus;
  final String title;
  final String description;

  AddTaskModel(
      {this.id,
      required this.taskStatus,
      required this.title,
      required this.description});

  factory AddTaskModel.toDB(Map<String, dynamic> db) {
    int tasksStatus = int.parse(db['taskStatus'].toString());
    AddTaskModel task = AddTaskModel(
        taskStatus: tasksStatus,
        title: db['title'],
        description: db['description']);
    return task;
  }

  factory AddTaskModel.fromDB(Map<String, dynamic> db) {
    int taskId = int.parse(db['taskId']);
    int taskStatus = int.parse(db['taskStatus']);
    return AddTaskModel(
        id: taskId,
        taskStatus: taskStatus,
        title: db['title'],
        description: db['description']);
  }

  Map<String, dynamic> toUser() {
    final data = <String, dynamic>{};
    data['taskId'] = id;
    data['taskStatus'] = taskStatus;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

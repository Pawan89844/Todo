class AddTaskModel {
  final int id;
  final int taskStatus;
  final String title;
  final String description;

  AddTaskModel(
      {required this.id,
      required this.taskStatus,
      required this.title,
      required this.description});

  factory AddTaskModel.fromDB(Map<String, dynamic> db) {
    int taskId = int.parse(db['taskId']);
    int taskStatus = int.parse(db['taskStatus']);
    return AddTaskModel(
        id: taskId,
        taskStatus: taskStatus,
        title: db['title'],
        description: db['description']);
  }

  List<Map<String, dynamic>> toUser() {
    final data = <String, dynamic>{};
    final tasks = <Map<String, dynamic>>[];
    data['taskId'] = id;
    data['taskStatus'] = taskStatus;
    data['title'] = title;
    data['description'] = description;
    tasks.add(data);
    return tasks;
  }
}

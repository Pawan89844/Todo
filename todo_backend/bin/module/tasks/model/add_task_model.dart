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
}

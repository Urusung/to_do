class ToDoList {
  final String category;
  final int id;
  final String work;
  final bool isComplete;

  ToDoList(
      {required this.category,
      required this.id,
      required this.work,
      this.isComplete = false});
}

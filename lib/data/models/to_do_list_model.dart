class ToDoListModel {
  final String id;
  final String title;
  final String description;
  final String? date;
  final String? time;
  final bool isCompleted;
  final String myListId;

  ToDoListModel({
    required this.id,
    required this.title,
    required this.description,
    this.date,
    this.time,
    required this.isCompleted,
    required this.myListId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'isCompleted': isCompleted ? 1 : 0,
      'myListId': myListId,
    };
  }

  factory ToDoListModel.fromMap(Map<String, dynamic> map) {
    return ToDoListModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      isCompleted: map['isCompleted'] == 1,
      myListId: map['myListId'],
    );
  }
}

class ToDoListsModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  final bool isCompleted;

  ToDoListsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isCompleted,
  });

  // fromMap 메서드 수정: Map을 받아서 인스턴스를 생성
  factory ToDoListsModel.fromMap(Map<String, dynamic> map) {
    return ToDoListsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  // toMap 메서드: 인스턴스를 Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'isCompleted': isCompleted,
    };
  }
}

class ToDoListsModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  final bool isCompleted;
  final String myListId;

  // Uuid를 사용하여 id를 자동으로 생성
  ToDoListsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isCompleted,
    required this.myListId, // 외래키
  }); // id가 null일 경우 Uuid로 자동 생성

  // 데이터베이스에 저장하기 위한 toMap 메서드
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

  // DB에서 가져온 데이터를 모델로 변환하는 메서드
  factory ToDoListsModel.fromMap(Map<String, dynamic> map) {
    return ToDoListsModel(
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

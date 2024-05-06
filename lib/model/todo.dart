class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  DateTime dateAdded;

  ToDo({required this.id, required this.todoText, this.isDone = false, required this.dateAdded});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Gym Workout', isDone: true, dateAdded: DateTime.now()),
      ToDo(id: '02', todoText: 'Breakfast Meal', isDone: true, dateAdded: DateTime.now()),
      ToDo(
        id: '03',
        todoText: 'Study Hour',
        dateAdded: DateTime.now()
      ),
      ToDo(
        id: '04',
        todoText: 'Check Emails',
        dateAdded: DateTime.now()
      ),
      ToDo(
        id: '05',
        todoText: 'LeetCode',
        dateAdded: DateTime.now()
      ),
      ToDo(
        id: '06',
        todoText: '30 Minutes Nap',
        dateAdded: DateTime.now()
      ),
    ];
  }
}

import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Admin _admin;
  late final Box<TodoModel> _todoModelBox;

  ObjectBox._init(this.store) {
    if (Admin.isAvailable()) {
      // Keep a reference until no longer needed or manually closed.
      _admin = Admin(store);
    }

    _todoModelBox = Box<TodoModel>(store);
  }
  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  insertTodoModel(TodoModel detail) {
    _todoModelBox.put(detail);
  }

  insertAllTodotModel(List<TodoModel> todoList) {
    _todoModelBox.putMany(todoList);
  }

  List<TodoModel> getAlltodoModel() {
    return _todoModelBox.getAll();
  }

  int getTodoModelCount() => _todoModelBox.count();

  bool delete(int todoId) {
    return _todoModelBox.remove(todoId);
  }

  Stream<List<TodoModel>> getAllUsingStream() {
    return _todoModelBox
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  Future<bool> editTodo(TodoModel data, int id) async {
    var query = _todoModelBox.query(TodoModel_.id.equals(id)).build();
    var detail = query.findFirst();
    detail = TodoModel(
        tittle: data.tittle, body: data.body, date: data.date, id: id);
    _todoModelBox.put(detail);
    return true;
  }

  // List<TodoModel> getAlltaskOfUser(int todoId) {
  //   final query = _todoModelBox.query(TodoModel_.id.equals(todoId)).build();
  //   List<TodoModel> list = query.find();
  //   return list;
  // }
}

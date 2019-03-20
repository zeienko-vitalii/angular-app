import 'dart:async';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialButtonComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<String> items = [];
  String winner;
  String newTodo = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  void omgRandom() {
    if (items != null && items.isNotEmpty) {
      int winnerPos = Random().nextInt(items.length);
      winner = items[winnerPos];
    }
  }

  String remove(int index) => items.removeAt(index);
}

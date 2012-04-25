var TodoMVC;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

TodoMVC = (function() {

  __extends(TodoMVC, Batman.App);

  function TodoMVC() {
    TodoMVC.__super__.constructor.apply(this, arguments);
  }

  TodoMVC.global(true);

  TodoMVC.root('todos#index');

  return TodoMVC;

})();

TodoMVC.Todo = (function() {

  __extends(Todo, Batman.Model);

  function Todo() {
    Todo.__super__.constructor.apply(this, arguments);
  }

  Todo.global(true);

  Todo.persist(Batman.RestStorage);

  Todo.encode('body', 'isDone');

  Todo.prototype.body = '';

  Todo.prototype.isDone = false;

  return Todo;

})();

TodoMVC.TodosController = (function() {

  __extends(TodosController, Batman.Controller);

  function TodosController() {
    this.create = __bind(this.create, this);
    TodosController.__super__.constructor.apply(this, arguments);
  }

  TodosController.prototype.index = function() {
    this.set('emptyTodo', new Todo);
    return this.render(false);
  };

  TodosController.prototype.create = function() {
    var _this = this;
    return this.emptyTodo.save(function() {
      return _this.set('emptyTodo', new Todo);
    });
  };

  TodosController.prototype.edit = function(node, event) {
    return $(node).addClass('editing');
  };

  TodosController.prototype.update = function(node, event) {
    alert(this.get('todo'));
    return $(node).parent().removeClass('editing');
  };

  return TodosController;

})();

TodoMVC.run();

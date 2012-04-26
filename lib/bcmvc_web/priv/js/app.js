var TodoMVC;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

TodoMVC = (function() {

  __extends(TodoMVC, Batman.App);

  function TodoMVC() {
    TodoMVC.__super__.constructor.apply(this, arguments);
  }

  TodoMVC.global(true);

  TodoMVC.root('todos#index');

  TodoMVC.model('todo');

  TodoMVC.controller('todos');

  TodoMVC.resources('todos');

  return TodoMVC;

})();

TodoMVC.run();

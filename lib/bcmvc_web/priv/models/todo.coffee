class TodoMVC.Todo extends Batman.Model
  @global: yes

  @persist TodoMVC.JSONRestStorage #Batman.RestStorage
  @encode 'body', 'isDone'

  body: ''
  isDone: false

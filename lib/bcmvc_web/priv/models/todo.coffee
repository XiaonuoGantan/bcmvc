class TodoMVC.Todo extends Batman.Model
  @global yes

  @persist Batman.RestStorage
  @encode 'body', 'isDone'

  body: ''
  isDone: false
# Define the principle Todo model with `body` and `isDone` attributes, and tell it to persist itself using Local Storage.
class TodoMVC.Todo extends Batman.Model
  @global yes # global exposes this class on the global object, so you can access `Todo` directly.

  @persist Batman.RestStorage # Batman.LocalStorage
  @encode 'body', 'isDone'

  body: ''
  isDone: false
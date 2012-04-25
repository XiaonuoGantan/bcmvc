# Create our application and namespace.
class TodoMVC extends Batman.App
  @global yes
  @root 'todos#index'

# Define the principle Todo model with `body` and `isDone` attributes, and tell it to persist itself using Local Storage.
class TodoMVC.Todo extends Batman.Model
  @global yes # global exposes this class on the global object, so you can access `Todo` directly.

  @persist Batman.RestStorage # Batman.LocalStorage
  @encode 'body', 'isDone'

  body: ''
  isDone: false

class TodoMVC.TodosController extends Batman.Controller
  index: ->
    # setup a binding for the new form
    @set 'emptyTodo', new Todo
    # prevent the implicit render of views/todos/index.html
    @render false

  create: =>
    @emptyTodo.save =>
      @set 'emptyTodo', new Todo

  edit: (node, event) ->
    $(node).addClass('editing')

  update: (node, event) ->
    alert @get('todo')
    $(node).parent().removeClass('editing')


# Start the app
TodoMVC.run()
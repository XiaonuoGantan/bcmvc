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

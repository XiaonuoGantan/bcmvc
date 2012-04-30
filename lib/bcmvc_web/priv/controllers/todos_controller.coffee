class TodoMVC.TodosController extends Batman.Controller
  emptyTodo: new TodoMVC.Todo()

  index: ->
    @set 'emptyTodo', new TodoMVC.Todo()
    @render false

   edit: (node, event) ->
     $(node).addClass('editing')

   update: (node, event) ->
     newTodo = new TodoMVC.Todo({id: $(node).attr('id'), body: $(node).val()})
     newTodo.save()
     $(node).parent().removeClass('editing')

  create: =>
    @emptyTodo.save (error, record)  =>
       @set 'emptyTodo', new TodoMVC

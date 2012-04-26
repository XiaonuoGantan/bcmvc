class TodoMVC.TodosController extends Batman.Controller
  index: ->
    @set 'emptyTodo', new Todo
    @render false

  create: =>
    @emptyTodo.save =>
       @set 'emptyTodo', new Todo

   edit: (node, event) ->
     $(node).addClass('editing')

   update: (node, event) ->
     newTodo = new Todo({id: $(node).attr('id'), body: $(node).val()})
     newTodo.save()
     $(node).parent().removeClass('editing')

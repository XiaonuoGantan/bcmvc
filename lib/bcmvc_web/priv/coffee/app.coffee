# Create our application and namespace.
class TodoMVC extends Batman.App
  @global yes
  @root 'todos#index'

  @model 'todo'
  @controller 'todos'

# Start the app
TodoMVC.run()
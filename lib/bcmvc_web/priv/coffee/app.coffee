class TodoMVC extends Batman.App
  @root 'todos#index'

  @model 'todo'
  @controller 'todos'

class TodoMVC.JSONRestStorage extends Batman.RestStorage
  serializeAsForm: false

# Start the app
TodoMVC.run()
Todos.TodosController = Em.ArrayController.extend
  actions:
    createTodo: ->
      # Get the todo title set by the "New Todo" text field
      title = @get('newTitle')
      return if !title.trim()

      # Create the new Todo model
      todo = Todos.Todo.createRecord {
        title: title
        isCompleted: false
      }

      # Clear the "New Todo" text field
      @set 'newTitle', ''

      # Save the new model
      todo.save()
      # @store.save()
    
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

    clearCompleted: ->
      completed = @filterProperty('isCompleted', true)
      completed.invoke('deleteRecord')
      completed.invoke('save')
    
  remaining: (->
    @filterProperty('isCompleted', false).get('length')
    ).property('@each.isCompleted')

  inflection: (->
    remaining = @get('remaining')
    if remaining == 1 then 'item' else 'items'
    ).property('remaining')

  completed: (->
    @filterProperty('isCompleted', true).get('length')
    ).property('@each.isCompleted')

  hasCompleted: (->
    @get('completed') > 0
    ).property('completed')

  allAreDone: ((key, value) ->
    if value == undefined
      !!@get('length') && @everyProperty('isCompleted', true)
    else
      @setEach('isCompleted', value)
      @invoke('save')
      value
    ).property('@each.isCompleted')

Todos.TodoController = Em.ObjectController.extend
  # needs: []
  actions: 
    editTodo: ->
      @set('isEditing', true) 

  isCompleted: ((key, value)->
    model = @get('model')

    if value == undefined
      # property being used as a getter
      model.get('isCompleted')
    else
      # property being used as a setter
      model.set('isCompleted', value)
      model.save()
      value
    ).property('model.isCompleted')  
 
  isEditing: false
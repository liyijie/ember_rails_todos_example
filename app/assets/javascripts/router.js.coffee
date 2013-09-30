# For more information see: http://emberjs.com/guides/routing/

Todos.Router.map ()->
  @resource('todos', { path: '/' }, ->
    @route 'active'
    @route 'completed'
    )

Todos.TodosRoute = Em.Route.extend
  model: ->
    @store.find(Todos.Todo)
    # Todos.Todo.find()

Todos.TodosIndexRoute = Em.Route.extend
  model: ->
    @modelFor('todos')

Todos.TodosActiveRoute = Em.Route.extend
  model: ->
    # Todos.Todo.filter (todo) ->
    #   !todo.get("isCompleted")
    @store.filter(Todos.Todo, (todo) ->
      !todo.get('isCompleted'))

  renderTemplate: (controller) ->
    @render 'todos/index', {controller: controller}
  
Todos.TodosCompletedRoute = Em.Route.extend
  model: ->
    @store.filter(Todos.Todo, (todo) ->
      todo.get('isCompleted'))

  renderTemplate: (controller) ->
    @render 'todos/index', {controller: controller}
  
   

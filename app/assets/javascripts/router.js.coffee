# For more information see: http://emberjs.com/guides/routing/

Todos.Router.map ()->
  @resource('todos', { path: '/' }, ->
    )
  # @resource('posts')

Todos.TodosRoute = Em.Route.extend
  # activate: ->
  # deactivate: ->
  # setupController: (controller, model)->
  # renderTemplate: ->
  # beforeModel: ->
  # afterModel: ->

  model: ->
    @store.find('todo')

Todos.TodosIndexRoute = Em.Route.extend
  model: ->
    @modelFor('todos')

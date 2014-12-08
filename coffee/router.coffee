Todos.Router.map ->
  @resource 'todos', path: '/', ->
    ### go here later ###
  return

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find('todo')

Todos.TodosIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('todos')

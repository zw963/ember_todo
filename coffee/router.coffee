Todos.Router.map ->
  @resource('todos', path: '/')
  return

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find('todo')

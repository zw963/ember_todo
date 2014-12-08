Todos.Router.map ->
  @resource 'todos', path: '/', ->
    # 一个 resources 中, 可以通过 @route 指定各种路由. (index 可以省略)
    @route('active')
    @route('completed')

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find('todo')

Todos.TodosIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('todos')

Todos.TodosActiveRoute = Ember.Route.extend
  model: ->
    @store.filter 'todo', (todo) ->
      !todo.get('isCompleted')

  # 用来render 某个指定的模板
  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

Todos.TodosCompletedRoute = Ember.Route.extend
  model: ->
    @store.filter 'todo', (todo) ->
      todo.get('isCompleted')

  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

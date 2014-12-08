Todos.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      # get the todo title set by the "NewTodo" text field
      title = @get('newTitle')
      return false unless title
      return unless title.trim()

      # create the new Todo model object.
      todo = @store.createRecord 'todo',
        title: title
        isCompleted: false

      @set('newTitle', '')

      todo.save()
    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      # invoke 是 EmberArray API 的一部分, 相当于 Rails 中的 try.
      completed.invoke('deleteRecord')
      completed.invoke('save')

  hasCompleted: ->
    Ember.computed ->
      @get('completed') > 0
    .property('completed')

  completed:
    Ember.computed ->
      @filterBy('isCompleted', true).get('length')
    .property('@each.isCompleted')

  remaining:
    Ember.computed ->
      @filterBy('isCompleted', false).get('length')
    .property('@each.isCompleted')

  inflection:
    Ember.computed ->
      remaining = @get('remaining')
      if remaining == 1 then 'item' else 'items'
    .property('remaining')

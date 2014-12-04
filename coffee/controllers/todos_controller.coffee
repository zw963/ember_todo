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
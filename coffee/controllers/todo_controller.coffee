Todos.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set('isEditing', true)

    acceptChanges: ->
      @set('isEditing', false)
      if Ember.isEmpty(@get('model.title'))
        @send('removeTodo')
      else
        @get('model').save()

    removeTodo: ->
      todo = @get('model')

      todo.deleteRecord();
      todo.save()

  isEditing: false,

  isCompleted:
    Ember.computed (key, value) ->
      model = @get('model')

      if value is undefined
        model.get('isCompleted')
      else
        model.set('isCompleted', value)
        model.save
        value

    .property('model.isCompleted')

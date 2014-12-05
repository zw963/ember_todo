Todos.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set('isEditing', true)
      return

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

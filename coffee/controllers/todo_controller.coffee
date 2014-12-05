Todos.TodoController = Ember.ObjectController.extend
  isCompleted:
    Ember.computed (key, value) ->
      model = @get('model')

      if value is undefined
        return model.get('isCompleted')
      else
        model.set('isCompleted', value)
        model.save
        value
    .property('model.isCompleted')

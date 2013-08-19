tasks =
	todo: ['Use Haml', 'Use LESS', 'Culture Session']
	done: ['Account Setting', 'Learn CoffeeScript', 'Learn Knockout.js']

class Task
	constructor: (@content) ->


class TasksViewModel
	constructor: (tasks) ->
		@newTask = ko.observable ''
		@todo = ko.observableArray (new Task content for content in tasks.todo)
		@done = ko.observableArray (new Task content for content in tasks.done)

	addTask: (task) =>
		if @newTask() then @todo.push new Task @newTask() else alert 'cannot be empty'

	deleteTask: (task) =>
		@todo.remove task

	doneTask: (task) =>
		@done.unshift (@todo.remove task)[0]

	redoTask: (task) =>
		@todo.push (@done.remove task)[0]

	clearDoneTask: (task) =>
		@done.remove task

ko.applyBindings new TasksViewModel tasks
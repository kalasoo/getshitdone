try
	tasks = JSON.parse localStorage.getItem 'getshitdoneTasks' or
		todo: []
		done: []
catch error
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
		if @newTask() 
			@todo.push new Task @newTask()
			@saveTasks()
		else 
			alert 'cannot be empty'

	deleteTask: (task) =>
		@todo.remove task
		@saveTasks()

	doneTask: (task) =>
		@done.unshift (@todo.remove task)[0]
		@saveTasks()

	redoTask: (task) =>
		@todo.push (@done.remove task)[0]
		@saveTasks()

	clearDoneTask: (task) =>
		@done.remove task
		@saveTasks()

	saveTasks: () =>
		console.log 'saveTasks'
		tasks = 
			todo: (task.content for task in @todo())
			done: (task.content for task in @done())

		localStorage.setItem('getshitdoneTasks', JSON.stringify tasks)

ko.applyBindings new TasksViewModel tasks
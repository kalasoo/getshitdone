try
	tasks = JSON.parse localStorage.getItem 'getshitdoneTasks' or
		todo: ['Something to do']
		done: ['Something done']
	if not tasks.todo.length and not tasks.done.length
		tasks = 
			todo: ['Something to do']
			done: ['Something done']
catch error
	tasks = 
		todo: ['Something to do']
		done: ['Something done']

class Task
	constructor: (content) ->
		@content = ko.observable(content)
		@editing = ko.observable(false)

class TasksViewModel
	constructor: (tasks) ->
		@newTask = ko.observable ''
		@todo = ko.observableArray (new Task content for content in tasks.todo)
		@done = ko.observableArray (new Task content for content in tasks.done)

	addTask: () =>
		if @newTask() != ''
			@todo.push new Task @newTask()
			@saveTasks()
			@newTask('')
		else 
			alert 'cannot be empty'

	deleteTask: (task) =>
		@todo.remove task
		@saveTasks()

	editTask: (task) =>
		task.editing(true)
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
		tasks = 
			todo: (task.content() for task in @todo())
			done: (task.content() for task in @done())

		localStorage.setItem('getshitdoneTasks', JSON.stringify tasks)

ko.applyBindings new TasksViewModel tasks
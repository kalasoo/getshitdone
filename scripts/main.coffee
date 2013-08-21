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

	deleteTask: () =>
		@todo.remove this
		@saveTasks()

	editTask: () =>
		this.editing(true)
		@saveTasks()

	doneTask: () =>
		@todo.remove this
		@done.unshift this
		@saveTasks()

	redoTask: () =>
		@done.remove this
		@todo.push this
		@saveTasks()

	clearDoneTask: () =>
		@done.remove this
		@saveTasks()

	saveTasks: () =>
		tasks = 
			todo: (task.content for task in @todo())
			done: (task.content for task in @done())

		localStorage.setItem('getshitdoneTasks', JSON.stringify tasks)

ko.applyBindings new TasksViewModel tasks
tasks =
	todo: [' ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat.', 'Learn Knockout.js', 'Learn CoffeeScript', 'A lot of things to do']
	done: ['Account setup', 'Learn websites', 'Interview', 'Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.']

class Task
	constructor: (@content) ->


class TasksViewModel
	constructor: (tasks) ->
		@newTask = ko.observable ''
		@todo = ko.observableArray (new Task content for content in tasks.todo)
		@done = ko.observableArray (new Task content for content in tasks.done)

	addTask: (task) ->
		if @newTask() then @todo.push new Task @newTask() else alert 'cannot be empty'

	deleteTask: (task) ->
		@todo.remove task

	doneTask: (task) ->
		@done.push @todo.pop task

	redoTask: (task) ->
		@todo.push @done.pop task

	clearDoneTask: (task) ->
		@done.remove task

ko.applyBindings new TasksViewModel tasks
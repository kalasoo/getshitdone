// Generated by CoffeeScript 1.6.3
(function() {
  var Task, TasksViewModel, tasks,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  tasks = {
    todo: ['Use Haml', 'Use LESS', 'Culture Session'],
    done: ['Account Setting', 'Learn CoffeeScript', 'Learn Knockout.js']
  };

  Task = (function() {
    function Task(content) {
      this.content = content;
    }

    return Task;

  })();

  TasksViewModel = (function() {
    function TasksViewModel(tasks) {
      this.clearDoneTask = __bind(this.clearDoneTask, this);
      this.redoTask = __bind(this.redoTask, this);
      this.doneTask = __bind(this.doneTask, this);
      this.deleteTask = __bind(this.deleteTask, this);
      this.addTask = __bind(this.addTask, this);
      var content;
      this.newTask = ko.observable('');
      this.todo = ko.observableArray((function() {
        var _i, _len, _ref, _results;
        _ref = tasks.todo;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          content = _ref[_i];
          _results.push(new Task(content));
        }
        return _results;
      })());
      this.done = ko.observableArray((function() {
        var _i, _len, _ref, _results;
        _ref = tasks.done;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          content = _ref[_i];
          _results.push(new Task(content));
        }
        return _results;
      })());
    }

    TasksViewModel.prototype.addTask = function(task) {
      if (this.newTask()) {
        return this.todo.push(new Task(this.newTask()));
      } else {
        return alert('cannot be empty');
      }
    };

    TasksViewModel.prototype.deleteTask = function(task) {
      return this.todo.remove(task);
    };

    TasksViewModel.prototype.doneTask = function(task) {
      return this.done.unshift((this.todo.remove(task))[0]);
    };

    TasksViewModel.prototype.redoTask = function(task) {
      return this.todo.push((this.done.remove(task))[0]);
    };

    TasksViewModel.prototype.clearDoneTask = function(task) {
      return this.done.remove(task);
    };

    return TasksViewModel;

  })();

  ko.applyBindings(new TasksViewModel(tasks));

}).call(this);

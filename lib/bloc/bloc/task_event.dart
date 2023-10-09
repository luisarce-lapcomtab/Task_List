part of 'task_bloc.dart';

abstract class TaskEvent {
  factory TaskEvent.onFetchTasks() => _FetchTasks();
  factory TaskEvent.onFetchComments(String taskId) => _FetchComments(taskId);
}

class _FetchTasks implements TaskEvent {}

class _FetchComments implements TaskEvent {
  _FetchComments(this.taskId);
  final String taskId;
}

// class _AddComment implements TaskEvent {}

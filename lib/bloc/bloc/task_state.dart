part of 'task_bloc.dart';

enum TaskStatus {
  initial,
  loading,
  success,
  error,
}

class TaskState extends Equatable {
  const TaskState({
    this.taskId = '',
    this.tasks = const <TaskModel>[],
    this.comments = const <CommentModel>[],
    this.status = TaskStatus.initial,
  });

  factory TaskState.initialState() => const TaskState();

  TaskState copyWith({
    String? taskId,
    List<TaskModel>? tasks,
    List<CommentModel>? comments,
    TaskStatus? status,
  }) =>
      TaskState(
        taskId: taskId ?? this.taskId,
        tasks: tasks ?? this.tasks,
        comments: comments ?? this.comments,
        status: status ?? this.status,
      );

  final String taskId;
  final List<TaskModel> tasks;
  final List<CommentModel> comments;
  final TaskStatus status;

  @override
  List<Object?> get props => [taskId, tasks, comments, status];
}

extension TaskStateX on TaskState {
  bool get _tasksEmpty => tasks.isEmpty;
  bool get error => status == TaskStatus.error;
  bool get tasksLoading => status == TaskStatus.loading;
  bool get loading => tasksLoading && _tasksEmpty;
  bool get errorStasks => error && !_tasksEmpty;
}

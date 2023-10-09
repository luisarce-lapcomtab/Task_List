import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_application/services/pocketbase.dart';

import '../../model/model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this._taskRepository) : super(TaskState.initialState()) {
    on<_FetchTasks>(_fetchTasksToState);
    on<_FetchComments>(_fetchCommentsToState);
    // on<_AddComment>(_mapAddCommentToState);
    add(TaskEvent.onFetchTasks());
  }

  final TaskRepository _taskRepository;

  Future<void> _fetchTasksToState(
    _FetchTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.loading));

    try {
      final tasks = await _taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskStatus.error));
    }
  }

  Future<void> _fetchCommentsToState(
    _FetchComments event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.loading));

    try {
      final comments = await _taskRepository.getCommentsForTask(event.taskId);
      emit(state.copyWith(
          comments: comments,
          status: TaskStatus.success,
          taskId: event.taskId));
    } catch (e) {
      emit(state.copyWith(status: TaskStatus.error));
    }
  }

  /*Future<void> _mapAddCommentToState(
    _AddComment event,
    Emitter<TaskState> emit,
  ) async {
    try {
      
    } catch (e) {
      
    }
  }*/
}

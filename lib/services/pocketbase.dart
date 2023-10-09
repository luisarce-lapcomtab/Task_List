import 'package:dio/dio.dart';
import 'package:tasks_application/model/model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
  Future<List<CommentModel>> getCommentsForTask(String id);
}

class PocketApi extends TaskRepository {
  PocketApi._internal();
  static PocketApi get instance => PocketApi._internal();
  final Dio _dio = Dio();

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final response =
          await _dio.get('http://127.0.0.1:8090/api/collections/tasks/records');

      final List<TaskModel> tasks = (response.data['items'] as List)
          .map((item) => TaskModel.fromJson(item))
          .toList();

      return tasks;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<CommentModel>> getCommentsForTask(String id) async {
    try {
      final response = await _dio.get(
        'http://127.0.0.1:8090/api/collections/comments/records?filter=(taskId="$id")',
      );

      final List<CommentModel> comment = (response.data['items'] as List)
          .map((item) => CommentModel.fromJson(item))
          .toList();

      return comment;
    } catch (e) {
      return [];
    }
  }

  /*Future createComment(String comment, String taskId) async {
    
    try {     
      
    } catch (e) {
      throw TaskRepositoryException('Could not create comment');
    }
  }*/
}

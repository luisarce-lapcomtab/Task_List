// Modelo de tareas

class TaskModel {
  String id;
  String title;
  String description;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        'description': description,
      };
}

// Modelo de comentarios

class CommentModel {
  String? id;
  String comment;
  String taskId;

  CommentModel({
    required this.id,
    required this.comment,
    required this.taskId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        comment: json['comment'],
        taskId: json['taskId'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "taskId": taskId,
      };
}

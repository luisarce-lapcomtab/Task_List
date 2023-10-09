import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasks_application/bloc/bloc/task_bloc.dart';
import 'package:tasks_application/model/model.dart';
import 'package:tasks_application/widgets/widgets.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  void initState() {
    fetchComments(widget.task.id);
    super.initState();
  }

  void fetchComments(String taskId) {
    BlocProvider.of<TaskBloc>(context).add(TaskEvent.onFetchComments(taskId));
  }

  void _showAddCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCommentDialog(taskId: widget.task.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              final List<CommentModel> comments = state.comments;
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 150,
                      collapsedHeight: 90,
                      flexibleSpace: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(17),
                        child: Text(
                          widget.task.description,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      title: Text(widget.task.title),
                      centerTitle: true,
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Comments:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final task = comments[index];
                        return ListTile(
                          leading: const BulletPoint(),
                          title: Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 8),
                            child: Text(
                              task.comment,
                            ),
                          ),
                          subtitle: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Fecha y hora del comment'),
                          ),
                        );
                      }, childCount: comments.length),
                    )
                  ],
                ),
              );
            },
          ),
          const CircleDecoration(),
          const WhiteCircle(),
          const SmallWhiteCircle(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCommentDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

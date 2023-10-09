import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_application/bloc/bloc/task_bloc.dart';
import 'package:tasks_application/page/taskdetails_page.dart';
import 'package:tasks_application/widgets/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task List'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.error) {
            return const Center(
              child: Text('error'),
            );
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];

              return Card(
                child: ListTile(
                  title: Text(
                    task.title,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  leading: const Icon(Icons.task_sharp),
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskDetailsPage(task: task)),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const AddTaskDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

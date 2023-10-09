part of 'widgets.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Title:'),
          TextField(
            controller: _titleController,
          ),
          const SizedBox(height: 10),
          const Text('Description:'),
          TextField(
            controller: _descriptionController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: () {
            final title = _titleController.text.trim();
            final description = _descriptionController.text.trim();

            if (title.isNotEmpty && description.isNotEmpty) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('CREATE'),
        ),
      ],
    );
  }
}

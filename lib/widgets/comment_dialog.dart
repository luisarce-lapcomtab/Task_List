part of 'widgets.dart';

class AddCommentDialog extends StatefulWidget {
  final String taskId;
  const AddCommentDialog({Key? key, required this.taskId}) : super(key: key);

  @override
  State<AddCommentDialog> createState() => _AddCommentDialogState();
}

class _AddCommentDialogState extends State<AddCommentDialog> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add comment'),
      content: TextField(
        controller: _commentController,
        decoration: const InputDecoration(hintText: 'Enter your comment here'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ADD'),
        ),
      ],
    );
  }
}

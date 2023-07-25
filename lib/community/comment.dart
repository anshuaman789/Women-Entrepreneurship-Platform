import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentDialog extends StatefulWidget {
  final String postId;

  CommentDialog({required this.postId});

  @override
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  TextEditingController _commentController = TextEditingController();

  Future<void> _postComment() async {
    String comment = _commentController.text.trim();

    if (comment.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('comments')
          .doc(widget.postId)
          .collection('post_comments')
          .add({
        'comment': comment,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Comment posted successfully!')),
      );

      _commentController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Comment'),
      content: TextField(
        controller: _commentController,
        decoration: InputDecoration(
          hintText: 'Enter your comment',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _postComment,
          child: Text('Post'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}

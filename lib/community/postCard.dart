import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  final String query;
  final String description;
  final String mediaURL;
  final DateTime timestamp;
  final String postId; // Add postId parameter

  const PostCard({
    required this.query,
    required this.description,
    required this.mediaURL,
    required this.timestamp,
    required this.postId, // Add required postId parameter
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _liked = false;
  bool _disliked = false;
  bool _showCommentBar =
      false; // State variable to control visibility of comment bar
  TextEditingController _commentController = TextEditingController();
  List<Map<String, dynamic>> _comments = []; // List to store comments

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(widget.timestamp);
    final formattedTimeRange = _formatTimeRange(difference);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/images/Anshu_Aman.jpeg"),
                ),
                SizedBox(width: 8),
                Text(
                  "Anshu Aman",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.query,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.description),
            const SizedBox(height: 8),
            Image.network(
              widget.mediaURL,
              height: 200, // Adjust the desired height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(formattedTimeRange),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _liked ? null : _handleLike,
                  icon: Icon(
                    _liked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    color: _liked ? Colors.blue : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: _disliked ? null : _handleDislike,
                  icon: Icon(
                    _disliked
                        ? Icons.thumb_down_alt
                        : Icons.thumb_down_alt_outlined,
                    color: _disliked ? Colors.red : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: _handleToggleCommentBar,
                  icon: const Icon(Icons.comment_outlined),
                ),
                IconButton(
                  onPressed: _handleShare,
                  icon: const Icon(Icons.share_outlined),
                ),
                IconButton(
                  onPressed: _handleReport,
                  icon: const Icon(Icons.report_outlined),
                ),
              ],
            ),
            Visibility(
              visible: _showCommentBar,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    suffixIcon: IconButton(
                      onPressed: _handlePostComment,
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Comments:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: _comments.map((comment) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        comment['userName'] ?? 'Unknown User',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(comment['text'] ?? ''),
                      const Spacer(),
                      Text(
                        _formatCommentTime(comment['timestamp']),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeRange(Duration difference) {
    if (difference.inSeconds < 60) {
      return "Posted just now";
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return "Posted $minutes minute${minutes != 1 ? 's' : ''} ago";
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return "Posted $hours hour${hours != 1 ? 's' : ''} ago";
    } else {
      final formatter = DateFormat.yMMMd();
      return "Posted on ${formatter.format(widget.timestamp)}";
    }
  }

  void _handleLike() {
    setState(() {
      _liked = true;
      _disliked = false;
    });
  }

  void _handleDislike() {
    setState(() {
      _disliked = true;
      _liked = false;
    });
  }

  void _handleToggleCommentBar() {
    setState(() {
      _showCommentBar = !_showCommentBar;
      if (_showCommentBar) {
        _commentController.clear();
      }
    });
  }

  void _handlePostComment() {
    String commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      setState(() {
        _comments.add({
          'userName': 'Anshu Aman',
          'text': commentText,
          'timestamp': DateTime.now(),
        });
      });
      _commentController.clear();
    }
    _handleToggleCommentBar(); // Close the comment bar after posting
  }

  String _formatCommentTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inSeconds < 60) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return "$minutes minute${minutes != 1 ? 's' : ''} ago";
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return "$hours hour${hours != 1 ? 's' : ''} ago";
    } else {
      final formatter = DateFormat.yMMMd();
      return "Posted on ${formatter.format(timestamp)}";
    }
  }

  void _handleShare() {
    // Implement your share action here.
  }

  void _handleReport() {
    // Implement your report action here.
  }
}

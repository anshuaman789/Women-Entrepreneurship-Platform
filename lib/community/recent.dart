import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentPage extends StatelessWidget {
  final List<Map<String, dynamic>> recentPosts;

  RecentPage(this.recentPosts);

  // List of fixed usernames for each card
  final List<String> fixedUsernames = [
    'Ayushi Jha',
    'Deepti Sharma',
    'Ayesha Khan',
    'Aditi Kumari ',
  ];

  // List of avatar image filenames for each card
  final List<String> avatarImages = [
    'assets/images/girl1.jpeg',
    'assets/images/girl2.jpeg',
    'assets/images/girl3.jpeg',
    'assets/images/girl4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    recentPosts.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
    return ListView.builder(
      itemCount: recentPosts.length,
      itemBuilder: (context, index) {
        final postData = recentPosts[index];
        return PostCard(
          query: postData['query'],
          description: postData['description'],
          mediaAsset: postData['mediaAsset'],
          timestamp: postData['createdAt'],
          userName: fixedUsernames[index %
              fixedUsernames
                  .length], // Use different fixed username for each card
          avatarImage: avatarImages[index %
              avatarImages
                  .length], // Use different fixed avatar image for each card
        );
      },
    );
  }
}

class PostCard extends StatefulWidget {
  final String query;
  final String description;
  final String mediaAsset;
  final DateTime timestamp;
  final String userName;
  final String avatarImage;

  const PostCard({
    required this.query,
    required this.description,
    required this.mediaAsset,
    required this.timestamp,
    required this.userName,
    required this.avatarImage,
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
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.avatarImage),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.query,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.description),
            const SizedBox(height: 8),
            Image.asset(
              widget.mediaAsset,
              height: 200,
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
                  icon: Icon(Icons.comment_outlined),
                ),
                IconButton(
                  onPressed: _handleShare,
                  icon: Icon(Icons.share_outlined),
                ),
                IconButton(
                  onPressed: _handleReport,
                  icon: Icon(Icons.report_outlined),
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
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(comment['text'] ?? ''),
                      const Spacer(),
                      Text(
                        _formatCommentTime(comment['timestamp']),
                        style: TextStyle(
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
      final days = difference.inDays;
      return "Posted $days day${days != 1 ? 's' : ''} ago";
    }
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
    });
  }

  void _handlePostComment() {
    // Get the comment from the text field
    final String commentText = _commentController.text;
    if (commentText.isNotEmpty) {
      // Add the comment to the comments list with the current timestamp
      setState(() {
        _comments.add({
          'userName': 'You', // Assuming the user is writing the comment
          'text': commentText,
          'timestamp': DateTime.now(),
        });
        // Clear the comment text field
        _commentController.clear();
      });
    }
  }

  void _handleShare() {
    // Implement your share action here.
  }

  void _handleReport() {
    // Implement your report action here.
  }
}

class SampleData {
  static List<Map<String, dynamic>> getSampleData() {
    return [
      {
        'query': 'Empowering Women in India',
        'description':
            'Supporting women\'s education, economic independence, and gender equality. #WomenEmpowerment #India',
        'mediaAsset': 'assets/images/image5.jpeg',
        'createdAt': DateTime.now().subtract(Duration(days: 2)),
      },
      {
        'query': 'Breaking Stereotypes',
        'description':
            'Challenging societal norms and breaking stereotypes to empower women. #BreakingStereotypes #WomenInIndia',
        'mediaAsset': 'assets/images/image1.jpeg',
        'createdAt': DateTime.now().subtract(Duration(hours: 5)),
      },
      {
        'query': 'Women in Leadership',
        'description':
            'Promoting women in leadership roles for a progressive India. #WomenLeaders #Empowerment',
        'mediaAsset': 'assets/images/image3.jpeg',
        'createdAt': DateTime.now().subtract(Duration(minutes: 13)),
      },
      {
        'query': 'Women Entrepreneurship',
        'description':
            'Encouraging women entrepreneurship for economic growth and empowerment. #WomenEntrepreneurs #India',
        'mediaAsset': 'assets/images/image2.jpeg',
        'createdAt': DateTime.now().subtract(Duration(minutes: 28)),
      },
    ];
  }
}

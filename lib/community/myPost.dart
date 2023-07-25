import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'postCard.dart';

class MyPostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data!.docs;

          if (posts.isNotEmpty) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index].data() as Map<String, dynamic>;
                final postId = posts[index].id;

                if (post != null) {
                  final timestamp = post['createdAt'] as Timestamp;

                  return PostCard(
                    query: post['query'],
                    description: post['description'],
                    mediaURL: post['mediaURL'],
                    timestamp: timestamp.toDate(),
                    postId: postId,
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          } else {
            return const Center(child: Text('No posts found'));
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text('An error occurred'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

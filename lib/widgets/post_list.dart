import 'package:flutter/material.dart';
import 'package:research_flutter_unit_test/data/models/post.dart';

class PostList extends StatefulWidget {
  final Future<List<Post>?> futurePost;
  const PostList({
    Key? key,
    required this.futurePost,
  }) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>?>(
      future: widget.futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Post> posts = snapshot.data!;
          if (posts.isEmpty) {
            return const Center(
              child: Text("Không có bài viết"),
            );
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final user = posts[index];
              return ListTile(
                title: Text(user.title),
                subtitle: Text(user.body),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

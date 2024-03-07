import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:research_flutter_unit_test/data/models/post.dart';
import 'package:research_flutter_unit_test/widgets/post_list.dart';

void main() {
  testWidgets('Displays List of post with title as title and subtitle as body', (tester) async {
    final posts = [
      Post(
        userId: 1,
        id: 1,
        title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      ),
      Post(
        userId: 1,
        id: 2,
        title: "qui est esse",
        body:
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
      ),
    ];
    Future<List<Post>?> mockFetchPosts() {
      return Future.delayed(
        const Duration(seconds: 1),
        () => posts,
      );
    }

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: PostList(
        futurePost: mockFetchPosts(),
      ),
    )));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(posts.length));
  });
}

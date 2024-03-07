import 'dart:convert';
import 'package:research_flutter_unit_test/data/models/post.dart';
import 'package:research_flutter_unit_test/data/repositories/post/ipost_repository.dart';
import 'package:http/http.dart' as http;

class PostRepository extends IPostRepository {
  @override
  Future<List<Post>?> fetchPosts() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {      
      return null;
    }
  }
}

import 'package:get/get.dart';
import 'package:research_flutter_unit_test/data/repositories/post/ipost_repository.dart';

import '../../data/models/post.dart';

class MainController extends GetxController {
  final IPostRepository _postRepository;

  MainController({
    required IPostRepository postRepository,
  }) : _postRepository = postRepository;

  Rx<List<Post>?> posts = Rx<List<Post>?>(null);

  Future<List<Post>?> fetchPosts() async {
    posts.value = await _postRepository.fetchPosts();
    return posts.value;
  }
}

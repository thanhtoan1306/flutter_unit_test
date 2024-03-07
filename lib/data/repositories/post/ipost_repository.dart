
import 'package:research_flutter_unit_test/data/models/post.dart';
import 'package:research_flutter_unit_test/data/repositories/ibase_repository.dart';

abstract class IPostRepository extends IBaseRepository {
  Future<List<Post>?> fetchPosts();
}

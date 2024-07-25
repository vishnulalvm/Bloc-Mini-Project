import 'package:myapp/data/repocitory/post_repo_impl.dart';
import 'package:myapp/domain/entities/post_entity.dart';
import 'package:myapp/domain/repocitory/post_repo.dart';

class PostUsecase {
  PostRepo postRepo = PostRepoImpl();

  Future<List<PostEntity>> getPostDataSource() async {

final posts = await postRepo.getPostFromDataSource();
    return posts;
  }
}

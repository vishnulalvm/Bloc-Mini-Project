import 'package:myapp/data/datasources/post_remote_source.dart';
import 'package:myapp/domain/entities/post_entity.dart';
import 'package:myapp/domain/repocitory/post_repo.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteSource postRemoteSource = PostRemoteSourceImpl();
  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRemoteSource.getPostFromApi();
    return posts;
  }
}

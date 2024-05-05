import 'package:vexana/vexana.dart';

import '../model/post_model.dart';
import '../../../product/services/manager/service_path.dart';
import 'Ijob_posting_service.dart';

class JopPostingService extends IJobPostingService {
  JopPostingService(super.manager, super.scaffoldKey);

  @override
  Future<List<Posts>?> fetchJobPostingList() async {
    final response = await manager.send<Posts, List<Posts>>(ServicePath.posts.rawValue, parseModel: Posts(), method: RequestType.GET);

    return response.data;
  }
}

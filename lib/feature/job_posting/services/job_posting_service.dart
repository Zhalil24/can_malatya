import 'package:vexana/vexana.dart';

import '../../../product/models/post_model.dart';
import '../../../product/services/manager/product_servive_path.dart';
import 'Ijob_posting_service.dart';

class JopPostingService extends IJobPostingService {
  JopPostingService(super.manager, super.scaffoldKey);

  @override
  Future<List<Posts>?> fetchJobPostingList() async {
    final response = await manager.send<Posts, List<Posts>>(ProductServicePath.posts.rawValue, parseModel: Posts(), method: RequestType.GET);

    return response.data;
  }
}

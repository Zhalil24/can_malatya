import 'Ihome_service.dart';
import '../../../product/models/photos_model.dart';
import '../../../product/services/manager/product_servive_path.dart';
import 'package:vexana/vexana.dart';

class HomeService extends IHomeService {
  HomeService(super.manager, super.scaffoldKey);

  @override
  Future<List<Photos>?> fetchHomeList() async {
    final response = await manager.send<Photos, List<Photos>>(ProductServicePath.photos.rawValue, parseModel: Photos(), method: RequestType.GET);

    return response.data;
  }
}

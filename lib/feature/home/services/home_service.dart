import '../../../product/services/manager/service_path.dart';
import 'Ihome_service.dart';
import '../model/photos_model.dart';
import 'package:vexana/vexana.dart';

class HomeService extends IHomeService {
  HomeService(super.manager, super.scaffoldKey);

  @override
  Future<List<Photos>?> fetchHomeList() async {
    final response = await manager.send<Photos, List<Photos>>(ServicePath.photos.rawValue, parseModel: Photos(), method: RequestType.GET);

    return response.data;
  }
}

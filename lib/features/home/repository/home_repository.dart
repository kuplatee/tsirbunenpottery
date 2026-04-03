import 'package:madmudmobile/common_cloud_service/cloud_service.dart';
import 'package:madmudmobile/utils/constants.dart';

class HomeRepository {
  final CloudService _cloudService;

  HomeRepository(this._cloudService);

  Future<String?> fetchHomePageImageFileName() async {
    final data = await _cloudService.fetchOne(
      collection: 'miscellaneous',
      documentId: homePageImageDocId,
    );
    return data?['name'] as String?;
  }
}

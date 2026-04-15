import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/utils/constants.dart';

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

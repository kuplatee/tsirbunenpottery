import 'package:madmudmobile/common_cloud_service/common_cloud_service.dart';

String? toHomePageFileName(ObjectDoc doc) {
  final data = doc.data() as DataMap;
  return data['name'];
}

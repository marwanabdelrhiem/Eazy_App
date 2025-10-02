
import '../../model/package_response.dart';

abstract class PackageRepository {
  Future<PackageResponse> getPackages();
}

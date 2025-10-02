import 'package:eazy/core/data/repo/package%20repo/package_remote_data_source.dart';

import '../../model/package_response.dart';
import 'package_repository.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageRemoteDataSource remote;

  PackageRepositoryImpl(this.remote);

  @override
  Future<PackageResponse> getPackages() async {
    final data = await remote.getPackages();
    return PackageResponse.fromJson(data);
  }
}

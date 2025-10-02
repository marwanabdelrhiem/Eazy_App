import 'package:eazy/core/data/model/setting_response.dart';

import '../../model/contact_response.dart';
import '../../model/terms_response.dart';
import 'general_remote_data_source.dart';
import 'general_repository.dart';

class GeneralRepositoryImpl implements GeneralRepository {
  final GeneralRemoteDataSource remote;

  GeneralRepositoryImpl(this.remote);

  @override
  Future<SettingResponse> getSettings() async {
    final data = await remote.getSettings();
    return SettingResponse.fromJson(data);
  }

  @override
  Future<TermsResponse> getTerms() async {
    final data = await remote.getTerms();
    return TermsResponse.fromJson(data);
  }

  @override


  @override
  Future<ContactResponse> sendContact(Map<String, dynamic> body) async {
    final data = await remote.sendContact(body);
    return ContactResponse.fromJson(data);
  }
}


import 'package:eazy/core/data/model/setting_response.dart';

import '../../model/contact_response.dart';
import '../../model/terms_response.dart';

abstract class GeneralRepository {
  Future<SettingResponse> getSettings();
  Future<TermsResponse> getTerms();
  Future<ContactResponse> sendContact(Map<String, dynamic> body);
}

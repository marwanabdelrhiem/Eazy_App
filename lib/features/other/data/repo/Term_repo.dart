import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/Term_respons.dart';

class TermRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, TermResponse>> getTerms() async
  {
    try {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.terms,
          isProtected: true
      );
      if (response.status) {
        var data = response.data as Map<String, dynamic>;
        TermResponse termResponse =
        TermResponse.fromJson(data);
        return right(termResponse);
      }
      else {
        return Left(response.message);
      }
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
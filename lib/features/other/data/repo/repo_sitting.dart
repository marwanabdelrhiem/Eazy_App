import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/Sitting_Response.dart';

class RepoSitting {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, SittingResponse>> getSitting() async
  {
    try {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.setting,
          isProtected: true
      );
      if (response.status) {
        var data = response.data as Map<String, dynamic>;
        SittingResponse sittingResponse =
        SittingResponse.fromJson(data);
        return right(sittingResponse);
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
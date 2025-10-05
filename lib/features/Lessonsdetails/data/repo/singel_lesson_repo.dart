import 'package:dartz/dartz.dart';
import 'package:eazy_app/features/Lessonsdetails/data/model/singel_lesson_response.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
class SingelLessonRepo{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, SingleLessonResponse>>
  getSingelLessonData(int id) async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.lesson(id: id),
        isProtected: true,
      );
      if (response.status) {
        SingleLessonResponse singleLessonResponse =
        SingleLessonResponse.fromJson(response.data);
        return Right(singleLessonResponse);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(e.toString());
    }

  }
}
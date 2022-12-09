import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:kochitask/screens/model/image_model.dart';
import 'package:kochitask/utils/exception_handling.dart';

class ImageGetService {
  static Future<ImageModel?> imageGetService(String? query, currentPage) async {
    final dio = Dio();

    try {
      log('itemNumber item:  ${currentPage.toString()}');

      String url = "https://pixabay.com/api/?"
          "key=16582589-68a2e0e5d7a78080a8fa51cbe"
          "&q=$query"
          "&page=$currentPage"
          "&per_page=6";
      /*  call api key   */
      final Response response = await dio.get(url);
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('response of get image with Query :${response.data}');
        ImageModel imageModel = ImageModel.fromJson(response.data);

        // totalPage=imageModel.totalImages;
        return imageModel;
      }

      /*  Catch error   */

    } catch (e) {
      log('get Image Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}

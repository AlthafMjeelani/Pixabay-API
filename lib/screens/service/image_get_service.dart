import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:kochitask/screens/model/image_model.dart';
import 'package:kochitask/utils/exception_handling.dart';

class ImageGetService {
  static Future<ImageModel?> imageGetService(String? query, currentPage) async {
    final dio = Dio();
    try {
      String url = "https://pixabay.com/api/?"
          "key=31943447-37837073aeee2809bd0484d8e"
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

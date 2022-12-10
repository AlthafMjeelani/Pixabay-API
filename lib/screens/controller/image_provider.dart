import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kochitask/screens/model/image_model.dart';
import 'package:kochitask/screens/service/image_get_service.dart';
import 'package:kochitask/screens/view/screen_image_view.dart';

class ImageController with ChangeNotifier {
  ImageModel? imageModel;
  bool isLoading = false;

  int currentPage = 1;
  int size = 10;
  num totelPages = 1;

  List<dynamic> hits = [];

  final TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();

  void getImages(String? query) async {
    log('controller called');
    isLoading = true;
    notifyListeners();
    await ImageGetService.imageGetService(query, currentPage).then((value) {
      log(currentPage.toString());
      imageModel = value;
      notifyListeners();
      List<dynamic> images =
          value!.imageDetails!.map((e) => e.webformatUrl).toList();
      hits.addAll(images);

      if (imageModel!.totalImages! % 10 == 0) {
        totelPages = imageModel!.totalImages! / 10;
        notifyListeners();
      } else {
        totelPages = 1 + (imageModel!.totalImages! / 10);
        notifyListeners();
      }

      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  void gotoImageView(context,image) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  ScreenImageView(image: image,),
    ));
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kochitask/screens/model/image_model.dart';
import 'package:kochitask/screens/service/image_get_service.dart';

class ImageController with ChangeNotifier {
  ImageModel? imageModel;
  bool isLoading = false;
  int currentPage = 1;
  int? totalPage;

  final TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();

  void getImages(String? query) async {
    log('controller called');
    isLoading = true;
    notifyListeners();
    await ImageGetService.imageGetService(query, currentPage).then((value) {
      if (value != null) {
        log(currentPage.toString());
        imageModel = value;

        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }
}

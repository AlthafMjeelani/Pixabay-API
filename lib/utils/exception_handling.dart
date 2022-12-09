import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kochitask/helper/app_popups.dart';

class DioExceptionhandler {
  static void errorHandler(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.error is SocketException) {
        AppPopUps.showToast('No Internet Connection', Colors.red);
      } else if (e.response?.statusCode == 400) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.response?.statusCode == 403) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.response?.statusCode == 404) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppPopUps.showToast('Connection Timout', Colors.red);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppPopUps.showToast('Recieve Timout', Colors.red);
      } else if (e.type == DioErrorType.cancel) {
        AppPopUps.showToast('Request cancelled', Colors.red);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppPopUps.showToast('Url  sent timeout', Colors.red);
      } else if (e.type == DioErrorType.response) {
        AppPopUps.showToast('Incorrect Input', Colors.red);
      } else if (e.type == DioErrorType.other) {
        AppPopUps.showToast('Something went Wrong', Colors.red);
      } else if (e.toString() == "Failed host lookup: 'geocode.xyz'") {
        // log('geocode-dont worry');
      } else if (e.toString() ==
          "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
        AppPopUps.showToast("Failed, Please try again", Colors.red);
      }
    }
  }
}

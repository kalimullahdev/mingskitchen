import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_restaurant/data/model/response/config_model.dart';
import 'package:flutter_restaurant/data/repository/splash_repo.dart';
import 'package:flutter_restaurant/helper/date_converter.dart';
import 'package:flutter_restaurant/view/base/custom_snackbar.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;

  SplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  BaseUrls _baseUrls;
  DateTime _currentTime = DateTime.now();

  ConfigModel get configModel => _configModel;
  BaseUrls get baseUrls => _baseUrls;
  DateTime get currentTime => _currentTime;

  Future<bool> initConfig(GlobalKey<ScaffoldMessengerState> globalKey) async {
    ApiResponse apiResponse = await splashRepo.getConfig();
    bool isSuccess;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(apiResponse.response.data);
      _baseUrls = ConfigModel.fromJson(apiResponse.response.data).baseUrls;
      isSuccess = true;
      notifyListeners();
    } else {
      isSuccess = false;
      String _error;
      if (apiResponse.error is String) {
        _error = apiResponse.error;
      } else {
        _error = apiResponse.error.errors[0].message;
      }
      print(_error);
      showCustomSnackBar(_error, globalKey.currentContext);
    }
    return isSuccess;
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }

// Todo://sdfdsf

  bool isRestaurantOpenNow(BuildContext context) {
    if (isRestaurantClosed(true)) {
      return false;
    }
    int _weekday = DateTime.now().weekday;
    if (_weekday == 7) {
      _weekday = 0;
    }
    for (int index = 0;
        index < _configModel.restaurantScheduleTime.length;
        index++) {
      if (_weekday.toString() ==
              _configModel.restaurantScheduleTime[index].day &&
          DateConverter.isAvailable(
            _configModel.restaurantScheduleTime[index].openingTime,
            _configModel.restaurantScheduleTime[index].closingTime,
            context,
          )) {
        return true;
      }
    }
    return false;
  }

  bool isRestaurantClosed(bool today) {
    DateTime _date = DateTime.now();
    if (!today) {
      _date = _date.add(Duration(days: 1));
    }
    int _weekday = _date.weekday;
    if (_weekday == 7) {
      _weekday = 0;
    }
    for (int index = 0;
        index < _configModel.restaurantScheduleTime.length;
        index++) {
      if (_weekday.toString() ==
          _configModel.restaurantScheduleTime[index].day) {
        return false;
      }
    }
    return true;
  }
}

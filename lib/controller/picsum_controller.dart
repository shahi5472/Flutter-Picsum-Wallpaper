import 'package:flutter/material.dart';
import 'package:flutter_picsum_wallpaper/apiz/picsum_api.dart';
import 'package:flutter_picsum_wallpaper/data/api_response.dart';
import 'package:flutter_picsum_wallpaper/data/picsum_model.dart';

class PicsumController extends ChangeNotifier {
  int currentIndex = 0;

  int currentPage = 1;
  int totalAvailablePage = 1;

  bool isLoading = true;

  bool isError = false;
  String errorMessage = '';

  List<PicsumModel> picsumModelList = [];

  Future<void> loadingData() async {
    ApiResponse result = await PicsumApi.instance.getPicsumList(currentPage);

    if (result.error) {
      isError = result.error;
      errorMessage = result.message;
    }

    if (!result.error) {
      picsumModelList.addAll(result.picsumList!);
    }

    isLoading = false;
    notifyListeners();
  }

  void navbarIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

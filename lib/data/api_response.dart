import 'package:flutter_picsum_wallpaper/data/picsum_model.dart';

class ApiResponse {
  List<PicsumModel>? picsumList;
  bool error;
  String message;

  ApiResponse({this.picsumList, required this.error, required this.message});
}

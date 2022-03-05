import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter_picsum_wallpaper/data/api_response.dart';
import 'package:flutter_picsum_wallpaper/data/picsum_model.dart';
import 'package:flutter_picsum_wallpaper/utils/rest_api.dart';

class PicsumApi {
  PicsumApi._();

  static PicsumApi get instance => PicsumApi._();

  Future<ApiResponse> getPicsumList(int page) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          RestApi.picsumListApi(page),
        ),
      );

      if (response.statusCode == 200) {
        return ApiResponse(
          error: false,
          message: 'Loading Done',
          picsumList: picsumModelFromJson(response.body),
        );
      } else {
        return ApiResponse(error: true, message: 'Unknown Exception');
      }
    } on SocketException catch (e) {
      return ApiResponse(error: true, message: 'Socket Exception ${e.message}');
    } catch (e) {
      return ApiResponse(error: true, message: 'Exception $e');
    }
  }
}

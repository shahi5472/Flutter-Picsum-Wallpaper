import 'package:flutter_picsum_wallpaper/utils/constants.dart';

class RestApi {
  RestApi._();

  static RestApi get instance => RestApi._();

  static const _baseUrl = 'https://picsum.photos/v2/list';

  static picsumListApi(int page) => _baseUrl + '?page=$page&limit=$pageLimit';
}

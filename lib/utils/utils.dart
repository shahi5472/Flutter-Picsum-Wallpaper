import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/bottom_bar.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/rounded_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

void showModalSheet(context, url) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, Animation first, Animation second) {
      return Stack(
        fit: StackFit.expand,
        children: [
          JelloIn(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(
                url,
                cacheKey: url,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: SlideInUp(
              duration: const Duration(milliseconds: 900),
              child: BottomBar(url: url),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: RoundedButton(onPressed: () {
              Navigator.of(context, rootNavigator: false).pop();
            }),
          ),
        ],
      );
    },
  );
}

void showToast(String message, Color color) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void _setWallpaper(context, int location, url) async {
  var cachedImage = await DefaultCacheManager().getSingleFile(url);
  WallpaperManagerFlutter().setwallpaperfromFile(cachedImage, location);
  Navigator.pop(context);
  showToast('Set new wallpaper', Colors.green);
}

void showSettingSheet(context, url) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Container(
              width: 80,
              height: 3,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20),
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'What would you like to do?',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(height: 20),
          _buildWallpaperButton(
            context,
            'SET WALLPAPER',
            () {
              _setWallpaper(context, WallpaperManagerFlutter.HOME_SCREEN, url);
            },
          ),
          _buildWallpaperButton(
            context,
            'SET LOCK SCREEN',
            () {
              _setWallpaper(context, WallpaperManagerFlutter.LOCK_SCREEN, url);
            },
          ),
          _buildWallpaperButton(
            context,
            'SET BOTH',
            () {
              _setWallpaper(context, WallpaperManagerFlutter.BOTH_SCREENS, url);
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    },
  );
}

_buildWallpaperButton(
  BuildContext context,
  String text,
  VoidCallback onPressed,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ),
  );
}

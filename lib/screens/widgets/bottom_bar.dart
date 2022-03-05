import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picsum_wallpaper/utils/utils.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share_plus/share_plus.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.deepPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconButton(
            Icons.favorite,
            () {},
          ),
          _iconButton(
            Icons.cloud_download,
            () async {
              String? result = await _download(url);
              if (result == null) {
                showToast('Error', Colors.red);
              } else {
                showToast('$result saved', Colors.green);
              }
            },
          ),
          _iconButton(
            Icons.share_sharp,
            () async {
              String? result = await _download(url);
              if (result != null) {
                Share.shareFiles([result]);
              }
            },
          ),
          _iconButton(
            Icons.settings,
            () {
              showSettingSheet(context, url);
            },
          ),
        ],
      ),
    );
  }

  _iconButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        shadowColor: Colors.black12,
      ),
    );
  }

  Future<String?> _download(url) async {
    try {
      var imageId = await ImageDownloader.downloadImage(url);
      if (imageId == null) {
        return null;
      }

      var path = await ImageDownloader.findPath(imageId);
      return path;
    } on PlatformException {
      return null;
    }
  }
}

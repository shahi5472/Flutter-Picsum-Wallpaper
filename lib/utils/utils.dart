import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/bottom_bar.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/rounded_button.dart';
import 'package:photo_view/photo_view.dart';

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
          JelloIn(child: PhotoView(imageProvider: NetworkImage(url))),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: SlideInUp(child: const BottomBar()),
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

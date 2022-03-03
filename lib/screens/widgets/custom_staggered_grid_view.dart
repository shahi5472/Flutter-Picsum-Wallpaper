import 'package:flutter/material.dart';
import 'package:flutter_picsum_wallpaper/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggeredGridView extends StatelessWidget {
  const CustomStaggeredGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      itemCount: 100,
      crossAxisCount: 3,
      staggeredTileBuilder: (index) => StaggeredTile.count(
        (index % 7 == 0) ? 2 : 1,
        (index % 7 == 0) ? 2 : 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        String url = 'https://picsum.photos/500/500?random=$index';
        return InkWell(
          onTap: () {
            showModalSheet(context, url);
          },
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

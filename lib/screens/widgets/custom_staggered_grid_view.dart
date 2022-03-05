import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picsum_wallpaper/data/picsum_model.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/bottom_loading.dart';
import 'package:flutter_picsum_wallpaper/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggeredGridView extends StatelessWidget {
  const CustomStaggeredGridView({
    Key? key,
    required this.picsumList,
    this.controller,
  }) : super(key: key);

  final List<PicsumModel> picsumList;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      controller: controller,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      itemCount: picsumList.length + 1,
      crossAxisCount: 3,
      staggeredTileBuilder: (index) => StaggeredTile.count(
        (index % 7 == 0) ? 2 : 1,
        (index % 7 == 0) ? 2 : 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        // return _imageViewUI(context, picsumList[index].downloadUrl);
        if (index == picsumList.length) {
          return const BottomLoading();
        }
        return _imageViewUI(
          context,
          'https://picsum.photos/200/300?random=$index',
        );
      },
    );
  }

  Widget _imageViewUI(context, url) {
    return InkWell(
      onTap: () {
        showModalSheet(context, url);
      },
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExplore extends StatelessWidget {
  const ShimmerExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        itemCount: 21,
        crossAxisCount: 3,
        staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1,
          (index % 7 == 0) ? 2 : 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Container(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}

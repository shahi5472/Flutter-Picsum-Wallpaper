import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picsum_wallpaper/controller/picsum_controller.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/custom_staggered_grid_view.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/error_view.dart';
import 'package:flutter_picsum_wallpaper/screens/widgets/shimmer_explore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  late PicsumController _controller;

  @override
  void initState() {
    _controller = Provider.of<PicsumController>(context, listen: false);

    scrollListener();

    if (_controller.currentPage == 1) {
      _controller.loadingData();
    }
    super.initState();
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_controller.currentPage <= _controller.totalAvailablePage) {
          _controller.currentPage += 1;
          _controller.totalAvailablePage += 1;
          _controller.loadingData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PicsumController>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Picsum Wallpaper')),
          body: data.isLoading
              ? const ShimmerExplore()
              : data.isError
                  ? ErrorView(
                      message: data.errorMessage,
                      onPressed: () {
                        _controller.loadingData();
                      },
                    )
                  : RefreshIndicator(
                      child: CustomStaggeredGridView(
                        controller: scrollController,
                        picsumList: data.picsumModelList,
                      ),
                      onRefresh: () async {
                        _controller.loadingData();
                      },
                    ),
          bottomNavigationBar: _navBar(),
        );
      },
    );
  }

  Widget _navBar() => CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.deepPurple,
        color: Colors.deepPurple,
        index: _controller.currentIndex,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.settings_sharp, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          _controller.navbarIndex(index);
        },
      );
}

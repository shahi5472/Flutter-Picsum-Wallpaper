import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picsum_wallpaper/controller/picsum_controller.dart';
import 'package:flutter_picsum_wallpaper/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PicsumController()),
      ],
      child: MaterialApp(
        title: 'Flutter Picsum Wallpaper',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const HomeScreen(),
      ),
    );
  }
}

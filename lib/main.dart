import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskproject/constthemedata.dart';
import 'package:taskproject/util/route.dart';
import 'package:taskproject/util/strings.dart';

void main() async {
  runApp(const ConfigApp());
}

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taskproject',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: homePage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int internetChanged = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      debugPrint(status.toString());
      switch (status) {
        case InternetConnectionStatus.connected:
          if (internetChanged == 1) {
            Get.snackbar(
              "Internet is back",
              "Great, your internet connection is restored.",
              icon: Icon(
                Icons.signal_wifi_4_bar_lock_rounded,
                color: Colors.green,
              ),
              backgroundColor: Colors.white,
              colorText: Colors.green[900],
            );
            setState(() {
              internetChanged = 0;
            });
          }
          break;
        case InternetConnectionStatus.disconnected:
          setState(() {
            internetChanged++;
          });
          Get.snackbar(
            "No Internet Connection",
            "Please check your internet.",
            icon: Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            colorText: Colors.red[900],
          );
          // redirectWhenInternetNotAvailable();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Title"),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text("Turn On/Off your Internet to check alert message."),
        ),
      ),
    );
  }
}

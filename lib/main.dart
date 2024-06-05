import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String appId = 'qh55BCTutCNmbaH9PljxOESznxfvwgunIUM4uOeZ';
  const String clientKey = 'wCmvM76ih0hsZxWpmdilAi1mfPB8qGb3SAn7IjiB';
  const String parseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(appId, parseServerUrl,
      clientKey: clientKey, autoSendSessionId: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PNLDON',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

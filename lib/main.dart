import 'package:flutter/material.dart';
import 'package:anthony_news_apps/injection.dart' as di ;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

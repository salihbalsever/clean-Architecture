import 'package:diwithriverpood/data/models/rating_model.dart';
import 'package:diwithriverpood/presentation/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'data/datasources/product_local_data_source.dart';
import 'data/models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  runApp(const ProviderScope(child: MyApp()));
}
Future<void> _initHive() async {
  // Get the application documents directory
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Set the Hive box directory to the app documents directory
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(RatingAdapter());
  // Register Hive adapters if needed
  // Hive.registerAdapter(ProductAdapter());
  // Open the 'products' box during initialization (optional)
  await ProductLocalDataSource().openProductBox; // Assuming there is a method to open the 'products' box
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductScreen(),
    );
  }


}

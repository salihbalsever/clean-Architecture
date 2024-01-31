import 'package:diwithriverpood/presentation/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(productProvider);
    return Scaffold(
      body: products.isEmpty?const Center(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            var productList=products[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: Text(productList.title),
                  subtitle: Text(productList.description),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 2, // Set the height of the line
                  color: Colors.blue,
                ),              ],
            );
          }),
    );
  }
}

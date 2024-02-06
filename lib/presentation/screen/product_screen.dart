import 'package:diwithriverpood/presentation/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_state.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifier);
    return Scaffold(
      body: productsState is ProductsStateSuccess
          ? ListView.builder(
              itemCount: productsState.products.length,
              itemBuilder: (context, index) {
                var productList = productsState.products[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      title: Text(productList.title),
                      subtitle: Text(productList.description),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 2, // Set the height of the line
                      color: Colors.blue,
                    ),
                  ],
                );
              })
      : productsState is ProductsStateError
              ? Center(
        child: Text(productsState.error.toString(),style: TextStyle(color: Colors.black),),
    )
              : const CircularProgressIndicator()
    );
  }
}

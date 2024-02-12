import 'package:diwithriverpood/presentation/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_state.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifier);
    return switch (productsState) {
      ProductsStateSuccess() => Scaffold(
          body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: productsState.products.length,
            itemBuilder: (context, index) {
              var productList = productsState.products[index];
              return ListTile(
                title: Text(productList.title),
                subtitle: Text(productList.description),
              );
            },
          ),
        ),
      ProductsStateError() => Center(
          child: Text(productsState.error.toString(),
              style: const TextStyle(color: Colors.black))),
      ProductsStateLoading() => const CircularProgressIndicator()
    };
   /* Scaffold(
        body: productsState is ProductsStateSuccess
            ? ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: productsState.products.length,
                itemBuilder: (context, index) {
                  var productList = productsState.products[index];
                  return ListTile(
                    title: Text(productList.title),
                    subtitle: Text(productList.description),
                  );
                },
              )
            : productsState is ProductsStateError
                ? Center(
                    child: Text(
                      productsState.error.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : const CircularProgressIndicator());*/
  }
}

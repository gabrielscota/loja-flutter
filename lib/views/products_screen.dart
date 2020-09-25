import 'package:flutter/material.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Products>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final productItems = productsProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productsProvider.itemsCount,
            itemBuilder: (context, index) => Column(
              children: [
                ProductItem(productItems[index]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments =
        ModalRoute.of(context).settings.arguments as ScreenArguments;
    final Product product = screenArguments.product;
    final String heroTag = screenArguments.heroTag;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260.0,
              width: double.infinity,
              child: Hero(
                tag: heroTag,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) => Center(
                    child: Container(
                      height: 32.0,
                      width: 32.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'R\$ ${product.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

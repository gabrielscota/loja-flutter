import 'package:flutter/material.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo usuário'),
            automaticallyImplyLeading: false,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.shop,
                size: 32.0,
              ),
              title: Text(
                'Loja',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH_HOME);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.payment,
                size: 32.0,
              ),
              title: Text(
                'Pedidos',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.edit,
                size: 32.0,
              ),
              title: Text(
                'Gerenciar Produtos',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 32.0,
              ),
              title: Text(
                'Sair',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}

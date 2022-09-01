import 'package:app_loja/src/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_loja/src/config/app_data.dart' as appData;
import 'package:app_loja/src/pages/orders/components/order_tile.dart';

// TELA DE PEDIDOS

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Pedidos',
          style: TextStyle(color: AppColors.shape, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: appData.orders[index]),
        itemCount: appData.orders.length,
      ),
    );
  }
}

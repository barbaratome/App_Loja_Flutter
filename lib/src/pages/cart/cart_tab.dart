import 'package:app_loja/src/config/app_colors.dart';
import 'package:app_loja/src/models/cart_item_model.dart';
import 'package:app_loja/src/pages/cart/components/cart_title.dart';
import 'package:app_loja/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:app_loja/src/config/app_data.dart' as app_data;

// TELA DO CARRINHO --------------------------------------------

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Carrinho',
          style: TextStyle(color: AppColors.shape, fontWeight: FontWeight.bold),
        ),
      ),

      // LISTA DE ITENS ADICIONADOS NO CARRINHO

      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return CartTile(
                  cartItem: app_data.cartItems[index],
                  remove: removeItemFromCart);
            },
            itemCount: app_data.cartItems.length,
          )),
          Container(
            padding: const EdgeInsets.all(25),
            height: 150,
            decoration: BoxDecoration(
                color: AppColors.shape,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),

            // APRESENTAÇÃO DO VALOR TOTAL DOS PEDIDOS

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total geral',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold),
                ),

                // BOTÃO CONCLUIR PEDIDO

                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrdemConfirmation();
                      print(result);
                    },
                    child: Text(
                      'concluir pedido',
                      style: TextStyle(fontSize: 18, color: AppColors.primary),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrdemConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (contex) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Sim',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

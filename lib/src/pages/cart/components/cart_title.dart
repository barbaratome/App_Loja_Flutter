import 'package:app_loja/src/models/cart_item_model.dart';
import 'package:app_loja/src/pages/cammon_widgets/quantity_widget.dart';
import 'package:app_loja/src/services/utils_services.dart';
import 'package:flutter/material.dart';

// CARD DE PRODUTOS SELECIONADOS NA TELA CARRINHO

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        // IMAGEM
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // TITULO

        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        // TOTAL

        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        // QUANTIDADE

        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(
              () {
                widget.cartItem.quantity = quantity;

                if (quantity == 0) {
                  // REMOVER ITEM DO CARRINHO
                  widget.remove(widget.cartItem);
                }
              },
            );
          },
          isRemovable: true,
        ),
      ),
    );
  }
}

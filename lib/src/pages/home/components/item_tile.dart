// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_loja/src/config/app_colors.dart';

import '../../../models/item_model.dart';
import '../../../services/utils_services.dart';
import '../../product/product_screen.dart';

class ItemTile extends StatelessWidget {

  final ItemModel item;
  

  ItemTile({
    Key? key,
    required this.item,
   
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScreen(
                  item: item,
                ),
              ),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // imagem

                  Expanded(
                      child: Hero(
                          tag: item.imgUrl, child: Image.asset(item.imgUrl, ))),
                  // nome

                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  // preço - unidade
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

        // ADICIONAR NO CARRINHO
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
                          },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(20))),
              height: 35,
              width: 30,
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: AppColors.shape,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}

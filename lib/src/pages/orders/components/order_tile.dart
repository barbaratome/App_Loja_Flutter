// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_loja/src/pages/orders/components/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_loja/src/config/app_data.dart';
import 'package:app_loja/src/models/cart_item_model.dart';
import 'package:app_loja/src/services/utils_services.dart';
import '../../../config/app_colors.dart';
import '../../../models/order_model.dart';
import '../../cammon_widgets/payment_dialog.dart';

// CARD DE PEDIDOS NA TELA PEDIDOS..

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
                style: TextStyle(
                  color: AppColors.secondary,
                ),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.heading,
                ),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // LISTA DE PRODUTOS NO PEDIDO

                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _OrderItemWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      )),
                  // DIVISORIA
                  const VerticalDivider(
                    color: Color.fromARGB(255, 196, 196, 196),
                    thickness: 1,
                    width: 8,
                  ),

                  // STATUS DO PEDIDO
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                      status: order.status,
                    ),
                  )
                ],
              ),
            ),
            // TOTAL

            Text.rich(
              TextSpan(
                style:  const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                      text: 'Total ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: utilsServices.priceToCurrency(order.total))
                ],
              ),
            ),

            // BOTÃO DE PAGAMENTO

            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  onPrimary: AppColors.shape,
                  shadowColor: AppColors.secondary,
                  elevation: 4,
                ),
                onPressed: () {
                  showDialog(
                      context: (context),
                      builder: (_) {
                        return PaymentDialog(
                          order: order,
                        );
                      });
                },
                icon: const Icon(Icons.qr_code),
                label: const Text(
                  'Pagar com QR Code',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}

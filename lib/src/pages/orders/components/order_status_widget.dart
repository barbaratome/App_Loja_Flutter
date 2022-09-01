// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';

// import '../../../config/app_colors.dart';

// class OrderStatusWidget extends StatelessWidget {
//   final String status;
//   final bool isOverdue;

//   final Map<String, int> allStatus = <String, int>{
//     'pading_payment': 0,
//     'refunded': 1,
//     'paid': 2,
//     'prepating_puerchase': 3,
//     'shipping': 4,
//     'delivered': 5,
//   };

//   int get currentStatus => allStatus[status]!;

//   OrderStatusWidget({
//     Key? key,
//     required this.status,
//     required this.isOverdue,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _StatusDot(isActive: true, title: 'Pedido confirmado'),
//         _CustomDivider(),
//         if (currentStatus == 1) ...[
//           _StatusDot(
//             isActive: true,
//             title: 'Pix estornado',
//             backgroundColor: Colors.orange,
//           ),
//         ] else if (isOverdue) ...[
//           const _StatusDot(
//             isActive: true,
//             title: 'Pagamento Pix Vencido',
//             backgroundColor: Colors.red,
//           ),
//         ] else ...[
//           _StatusDot(isActive: false, title: 'Pagamento'),
//           Divider(),
//           _StatusDot(isActive: false, title: 'Preparando'),
//           Divider(),
//           _StatusDot(isActive: false, title: 'Envio'),
//           Divider(),
//           _StatusDot(isActive: false, title: 'Entregue'),
//         ]
//       ],
//     );
//   }
// }

// // DIVISOR DAS BOLINHAS

// class _CustomDivider extends StatelessWidget {
//   const _CustomDivider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//       height: 10,
//       width: 2,
//       color: AppColors.secondary,
//     );
//   }
// }

// class _StatusDot extends StatelessWidget {
//   final bool isActive;
//   final String title;
//   final Color? backgroundColor;

//   const _StatusDot({
//     Key? key,
//     required this.isActive,
//     required this.title,
//     this.backgroundColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         //  DOT
//         Container(
//           alignment: Alignment.center,
//           height: 20,
//           width: 20,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColors.primary,
//               ),
//               color: isActive
//                   ? backgroundColor ?? Colors.green
//                   : Colors.transparent),
//           child: isActive
//               ? const Icon(
//                   Icons.check,
//                   size: 13,
//                   color: Colors.white,
//                 )
//               : const SizedBox.shrink(),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         // TEXT
//         Expanded(
//           child: Text(
//             title,
//             style: TextStyle(fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:app_loja/src/config/app_colors.dart';
import 'package:flutter/material.dart';


class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.isOverdue,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: 'Pedido recebido',
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado por falta de pagamento',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento Pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Pago',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparando',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: 'Enviado',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: 'Entregue',
          ),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.stroke
            ),
            color: isActive
                ? backgroundColor ?? Colors.green
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(width: 5),

        // Texto
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

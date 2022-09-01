import 'package:app_loja/src/models/order_model.dart';
import 'package:app_loja/src/models/user_model.dart';

import '../models/cart_item_model.dart';
import '../models/item_model.dart';

// MODELOS DE APRESENTAÇÃO DOS PRODUTOS, CATEGORIAS, PRODUTOS NO CARRINHO.. ETC

ItemModel panoBaby = ItemModel(
  itemName: 'Toalhas "baby"',
  imgUrl: 'assets/image/baby.png',
  unit: ' kit',
  price: 75.0,
  description:
      'O kit de toalhas baby é ideal para aquele passeio com seu bebê, contém 3 unidades podendo escolher o desenho',
);
ItemModel toalhas = ItemModel(
  itemName: 'Panos de Prato',
  imgUrl: 'assets/image/pano.png',
  unit: ' uni',
  price: 18.5,
  description: 'Panos de prato, ideal para o dia a dia.',
);
ItemModel ecoBag = ItemModel(
  itemName: 'Eco-Bag',
  imgUrl: 'assets/image/bag.png',
  unit: ' uni',
  price: 38.5,
  description: 'Eco-Bag te acompanha em todo lugar, com muito charme e estilo',
);
ItemModel ecoBag1 = ItemModel(
  itemName: 'Bag Flores',
  imgUrl: 'assets/image/baag.png',
  unit: ' uni',
  price: 38.0,
  description: 'Eco-Bag te acompanha em todo lugar, com muito charme e estilo',
);

ItemModel ecoBag2 = ItemModel(
  itemName: 'Pano de Prato',
  imgUrl: 'assets/image/bg.png',
  unit: ' uni',
  price: 18.5,
  description: 'Eco-Bag te acompanha em todo lugar, com muito charme e estilo',
);
ItemModel ecoBag3 = ItemModel(
  itemName: 'Bag',
  imgUrl: 'assets/image/pg.png',
  unit: ' uni',
  price: 38.0,
  description: 'Eco-Bag te acompanha em todo lugar, com muito charme e estilo',
);

List<ItemModel> items = [panoBaby, toalhas, ecoBag, ecoBag1, ecoBag2, ecoBag3];

List<String> categories = ['Toalhas', 'Pano de Prato', 'Eco Bag', '+'];

List<CartItemModel> cartItems = [
  
  CartItemModel(
    item: panoBaby,
    quantity: 1,
  ),
  CartItemModel(
    item: ecoBag1,
    quantity: 1,
  ),
  CartItemModel(
    item: toalhas,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  name: 'Usuário Logado ',
  email: 'usuario.logado@gmail.com ',
  phone: '11 992555555',
  cpf: '000.000.000-05',
  password: '010101',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-09-09 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-09-09 11:00:10.458',
    ),
    id: 'ID1003',
    status: 'refunded',
    total: 113.50,
    items: [
      CartItemModel(
        item: ecoBag,
        quantity: 1,
      ),
      CartItemModel(
        item: panoBaby,
        quantity: 1,
      ),
    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-09-09 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-09-09 11:00:10.458',
    ),
    id: 'ID1203',
    status: 'pending_payment',
    total: 22.0,
    items: [
      CartItemModel(
        item: toalhas,
        quantity: 1,
      ),
    ],
  ),
];

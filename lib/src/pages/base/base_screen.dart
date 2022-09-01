import 'package:app_loja/src/pages/orders/orders_tab.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../cart/cart_tab.dart';
import '../home/home_tab.dart';
import '../profile/profile_tab.dart';

// BASE DA HOME, CONTENDO O MENU INFERIOR E CHAMADA PARA AS TELAS

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.shape,
        unselectedItemColor: AppColors.stroke,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
              pageController.jumpToPage(index);
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn);
            },
          );
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

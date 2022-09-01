import 'package:app_loja/src/config/app_colors.dart';
import 'package:app_loja/src/pages/cart/cart_tab.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'components/category_tile.dart';
import 'components/item_tile.dart';
import 'package:app_loja/src/config/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Toalhas';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // LOGO NA APP BAR
        title: const Text.rich(TextSpan(
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: 'Atêlie ',
                  style: TextStyle(color: AppColors.secondary)),
              TextSpan(
                  text: 'da Sil', style: TextStyle(color: AppColors.secondary)),
            ])),

        // CARRINHO DA APP BAR
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CartTab();
                    },
                  ),
                );
              },
              child: Badge(
                badgeColor: Colors.red,
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.shape,
                    fontSize: 12,
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: AppColors.secondary,
                ),
              ),
            ),
          )
        ],
      ),

      // BARRA DE PESQUISA
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: 'Pesquisar ...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.primary,
                ),
                fillColor: const Color.fromARGB(255, 232, 229, 229),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          // LINHA DE CATEGORIAS
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: app_data.categories.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                );
              },
            ),
          ),

          // GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

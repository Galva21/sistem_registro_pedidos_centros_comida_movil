import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_registro_pedidos/models/Category.dart';
import 'package:sistema_registro_pedidos/pages/CategoryListPage.dart';
import 'package:sistema_registro_pedidos/pages/FoodCentersMapPage.dart';
import 'package:sistema_registro_pedidos/pages/MyOrderPage.dart';
import 'package:sistema_registro_pedidos/pages/ProfilePage.dart';
import 'package:sistema_registro_pedidos/pages/ScannerQRPage.dart';
import 'package:sistema_registro_pedidos/pages/SelectedCategoryPage.dart';
import 'package:sistema_registro_pedidos/provider/GoogleProvider.dart';
import 'package:sistema_registro_pedidos/provider/SelectedPageProvider.dart';
import 'package:sistema_registro_pedidos/widgets/AppBarWidget.dart';
import 'package:sistema_registro_pedidos/widgets/CardListCategoriesWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int currentIndex = 0;
  List listBottomBar = [
    CategoryListPage(),
    FoodCentersMapPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<SelectedPageProvider>(context, listen: false);

    return Scaffold(
      // drawer: Drawer(),
      appBar: MainAppBar(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: listBottomBar[indexProvider.currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 500),
        curve: Curves.easeInBack,
        selectedIndex: indexProvider.currentIndex,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onItemSelected: (index) {
          setState(() {
            indexProvider.currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.utensils,
              ),
              title: Text('       Menu'),
              activeColor: Colors.orange,
              inactiveColor: Colors.blueGrey),
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.mapMarkedAlt,
              ),
              title: Text('       Mapa'),
              activeColor: Colors.green,
              inactiveColor: Colors.blueGrey),
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.userAlt,
              ),
              title: Text('       Mi perfil'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.blueGrey),
        ],
      ),
    );
  }
}

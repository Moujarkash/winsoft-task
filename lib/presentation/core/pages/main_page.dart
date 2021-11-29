import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:winsoft_task/presentation/core/routes/router.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        PrescriptionRouter(),
        ProductRouter(),
        OrderRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (tabsRouter.activeIndex == index && !tabsRouter.isRoot) {
              tabsRouter.popTop();
            } else {
              tabsRouter.setActiveIndex(index);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Prescription',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Orders',
            ),
          ],
        );
      },
    );
  }
}

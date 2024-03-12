import 'package:appbardesign/home_screen.dart';
import 'package:appbardesign/profile.dart';
import 'package:appbardesign/setting.dart';
import 'package:appbardesign/wallet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            elevation: 10,
            shadowColor: Colors.black,
            title: const Text(
              "Appbar with Tabs",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green[300],
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 32),
              dividerColor: Colors.transparent,
              onTap: (value) {
                // print(value);
                setState(() {
                  currentTab = value;
                });
              },
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: (currentTab == 0) ? 18 : 12,
                        color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: (currentTab == 1) ? 18 : 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: (currentTab == 2) ? 18 : 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Setting",
                    style: TextStyle(
                      fontSize: (currentTab == 3) ? 18 : 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeScreen(),
            WalletScreen(),
            ProfileScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mart_8_ornekler/tab_subwidgets/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "XFLIX",
          style: TextStyle(
              color: Colors.black, fontSize: 31, fontWeight: FontWeight.w600),
        ),
        bottom: TabBar(
          onTap: (tabIndex) {
            setState(() {
              _tabController.index = tabIndex;
            });
          },
          indicatorColor: Colors.amber,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Icon(
              Icons.home,
              size: 32,
            ),
            Icon(
              Icons.leaderboard,
              size: 32,
            ),
            Icon(
              Icons.person,
              size: 32,
            ),
          ],
        ),
      ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: [
      //     Center(child: Text("Anasayfam", style: _style)),
      //     Center(child: Text("Eğitim Sayfası", style: _style)),
      //     Center(child: Text("Profil Sayfam", style: _style))
      //   ],
      // ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _tabController.index == 0
                ? Center(
                    child: Text(
                      "Anasayfam",
                      style: _style,
                    ),
                  )
                : _tabController.index == 1
                    ? Center(
                        child: Text(
                          "Eğitim Sayfası",
                          style: _style,
                        ),
                      )
                    : MyProfilePAge()
          ],
        ),
      ),
    );
  }
}

final TextStyle _style = TextStyle(
    color: Colors.grey.shade900, fontWeight: FontWeight.w600, fontSize: 20);

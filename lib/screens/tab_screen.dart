import 'package:demo/ad_screen.dart';
import 'package:demo/screens/drawer.dart';
import 'package:demo/screens/history_screen.dart';
import 'package:demo/screens/home/home_screen.dart';
import 'package:demo/screens/mr_profile_screen.dart';
import 'package:demo/screens/share_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black12.withOpacity(0.6), // Background color
        barrierDismissible: true,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) {
          return const AdBannerScreen();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int i) {
      setState(() {
        index = i;
      });
    }

    List<Widget> screens = [
      const ShareScreen(),
      const HomeScreen(),
      const HistoryScreen(),
      // const HistoryScreen(),
      const MRProfileScreen(
        fromTabScreen: true,
      ),
    ];
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share"),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/notes.png")), label: "history"),
      // const BottomNavigationBarItem(
      //     icon: Icon(Icons.security), label: "security"),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/profile.png")), label: "profile"),
    ];
    return Scaffold(
      bottomSheet: index == 2
          ? BottomSheet(
              animationController: AnimationController(
                duration: const Duration(microseconds: 0),
                vsync: this,
              ),
              enableDrag: false,
              onClosing: () {},
              builder: (context) => Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Present",
                      style: TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
                    ),
                    SizedBox(width: 15),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Absent",
                      style: TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
                    ),
                  ],
                ),
              ),
            )
          : null,
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: SizedBox(height: 30, child: Image.asset("assets/logo.png")),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const ImageIcon(
            AssetImage("assets/drawer.png"),
          ),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              width: MediaQuery.of(context).size.width * 0.22,
              child: const FittedBox(
                child: Text(
                  "Valid - 5 Years",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 106, 183, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(0, 106, 183, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        items: items,
        currentIndex: index,
        onTap: _onItemTapped,
      ),
      body: screens[index],
    );
  }
}

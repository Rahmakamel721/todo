import 'package:flutter/material.dart';
import 'package:todo/layout/HomeView/HomeView.dart';
import 'package:todo/layout/HomeView/widget/BottomSheet.dart';
import 'package:todo/layout/Setting/Setting.dart';

class HomeLayout extends StatefulWidget {
  static const routeName = 'home';
   HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int SlectedIndex = 0;
  List<Widget> Pages = [
    HomeView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,

          ),

          padding: EdgeInsets.all(6),
          child: FloatingActionButton(onPressed: () {
            addTask();
          }, child: Icon(Icons.add, color: Colors.white,))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,

      body: Pages[SlectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,

        child: BottomNavigationBar(
            onTap: (int value) {
              setState(() {
                SlectedIndex = value;
              });
            },
            currentIndex: SlectedIndex,
            items: [
              BottomNavigationBarItem(label: 'Home ', icon: ImageIcon(
                  AssetImage('assets/image/Icon awesome-list.png')
              )),
              BottomNavigationBarItem(label: 'Setting ', icon: ImageIcon(
                AssetImage('assets/image/Icon feather-settings.png'),
              )),

            ]),
      ),
    );
  }


  void addTask() {
    showModalBottomSheet(
      context: context,
      builder: (context) =>  BottomSheetView());
  }
}
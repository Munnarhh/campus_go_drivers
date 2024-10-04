import 'package:campus_go_drivers/core/constants/constants.dart';
import 'package:campus_go_drivers/features/home/presentation/pages/tab_pages/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatefulWidget {
  static String routeName = 'MainScreenPage';
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenPage> {
  int currentindex = 0;
  final screens = [
    HomeTabPage(),
    Center(
      child: Text('No'),
    ),
    Center(
      child: Text('Yes'),
    ),
    Center(
      child: Text('Home'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        iconSize: 25,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
        selectedFontSize: 16.sp,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor2,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Earnings',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ratings',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

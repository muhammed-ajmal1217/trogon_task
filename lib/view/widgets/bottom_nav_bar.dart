import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogontask/controller/bottom_bar_provider.dart';
import 'package:trogontask/helpers/app_colors.dart';
import 'package:trogontask/view/analysis_screen.dart';
import 'package:trogontask/view/home_page/home_screen.dart';
import 'package:trogontask/view/my_course_screen.dart';
import 'package:trogontask/view/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    MyCourseScreen(),
    AnalysisScreen(),
    ProfileScreen()
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarProvider>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      EneftyIcons.home_outline,
                      color: bottomProvider.currentIndex == 0
                           ? AppColors.activeColor
                          : AppColors.inactiveColor,
                    ),
                    onPressed: () {
                      bottomProvider.navigatePage(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      EneftyIcons.document_code_outline,
                      color: bottomProvider.currentIndex == 1
                          ? AppColors.activeColor
                          : AppColors.inactiveColor,
                    ),
                    onPressed: () {
                      bottomProvider.navigatePage(1);
                    },
                  ),
                  SizedBox(width: 40), 
                  IconButton(
                    icon: Icon(
                      EneftyIcons.book_saved_outline,
                      color: bottomProvider.currentIndex == 2
                          ? AppColors.activeColor
                          : AppColors.inactiveColor,
                    ),
                    onPressed: () {
                      bottomProvider.navigatePage(2);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      EneftyIcons.profile_outline,
                      color: bottomProvider.currentIndex == 3
                          ? AppColors.activeColor
                          : AppColors.inactiveColor,
                    ),
                    onPressed: () {
                      bottomProvider.navigatePage(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Image.asset('assets/Vector.png'),
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}

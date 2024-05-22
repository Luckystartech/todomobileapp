import 'package:flutter/material.dart';
import 'package:todoapp/common/app_style.dart';
import 'package:todoapp/views/calendar_screen.dart';
import 'package:todoapp/views/home_screen.dart';
import 'package:todoapp/views/todo_tasks_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = const [HomeScreen(), CalenderScreen(), TodoTaskScreen()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppStyle.primaryColor,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'All tasks'),
        ],
      ),
      // Greet User Section
      body: screens[selectedIndex]
    );
  }
}

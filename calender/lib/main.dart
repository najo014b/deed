//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'profile.dart';
import 'gameer.dart';
import 'communityys.dart';
import 'homepage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  //late TabController _tabController;
  int currentIndex = 0;
  //PageController pageController = PageController();

  // List of widgets for each screen
  final List<Widget> screens = [
    HomePage(),
    CommunityScreen(),
    GameScreen(),
    ProfileScreen(),
  ];
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    //pageController.jumpToPage(currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
        //index: currentIndex,
      ),
              
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        type:BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: currentIndex, // Highlight current icon
        onTap: onItemTapped, // Handle icon taps
        items: [
          BottomNavigationBarItem(

             icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.blue : Colors.black,
            ),
            //label: 'Home',
           // icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
             icon: Icon(
              Icons.group,
              color: currentIndex == 1 ? Colors.blue : Colors.black,
            ),
            label: 'Community',
            //icon: Icon(Icons.group, color: Colors.black),
           // label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videogame_asset,
              color: currentIndex == 2 ? Colors.blue : Colors.black,
            ),
            label: 'Games',
            //icon: Icon(Icons.videogame_asset, color: Colors.black),
            //label: '',
          ),
          BottomNavigationBarItem(

            icon: Icon(
              Icons.person,
              color: currentIndex == 3 ? Colors.blue : Colors.black,
            ),
            label: 'Profile',
            //icon: Icon(Icons.person, color: Colors.black),
            //label: '',
          ),
        ],
      ),
    );
  }
}

/*
// Individual tab pages for each tab (Deeds, Habits, Events)
// Stateful Widget for the 'Deeds' Tab
class DeedsTab extends StatefulWidget {
  @override
  DeedsTabState createState() => DeedsTabState();
}

class DeedsTabState extends State<DeedsTab> {

CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Calendar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*

  int deedCount = 0;

  void _incrementDeeds() {
    setState(() {
      deedCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Deeds Count: $deedCount', style: TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: _incrementDeeds,
            child: Text('Add Deed'),
          ),
        ],
      ),
    );
  }*/
}

// Stateful Widget for the 'Habits' Tab
class HabitsTab extends StatefulWidget {
  @override
  HabitsTabState createState() => HabitsTabState();
}

class HabitsTabState extends State<HabitsTab> {
  
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Calendar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  /*
  final TextEditingController _habitController = TextEditingController();
  List<String> habits = [];

  void _addHabit() {
    setState(() {
      if (_habitController.text.isNotEmpty) {
        habits.add(_habitController.text);
        _habitController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _habitController,
            decoration: InputDecoration(labelText: 'Enter a new habit'),
          ),
        ),
        ElevatedButton(
          onPressed: _addHabit,
          child: Text('Add Habit'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(habits[index]),
            ),
          ),
        ),
      ],
    );
  }*/
}

// Stateful Widget for the 'Events' Tab
class EventsTab extends StatefulWidget {
  @override
  EventsTabState createState() => EventsTabState();
}

class EventsTabState extends State<EventsTab> {
  //DateTime selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Calendar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

            //event reminder line
            
            SizedBox(height: 16),
            Container(
              color: Colors.purple,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(                  
                    child:Text(
                      "Events Reminder",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  
                    /*ElevatedButton(
                      onPressed: () {
                        print("Basic Button Pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // New way to set background color
                        foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Create"),
                    ),*/
                ],
                ),
            ),
                 SizedBox(height: 8),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // New way to set background color
                  foregroundColor: Colors.purple, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 300, vertical: 15),
                  ),
                  child: Text("list"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // New way to set background color
                    foregroundColor: Colors.purple, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 300, vertical: 15),
                  ),
                  child: Text("Create"),
                ),
              ],
            ),

        ],
      ),
    );
  }

}*/
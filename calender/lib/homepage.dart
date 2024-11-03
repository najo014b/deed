
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
    //final VoidCallback goToSearchPage;
    //HomePage({required this.goToSearchPage});

  late final Widget goToSearchPage;

  @override
  void initState() {
    super.initState();
    goToSearchPage = MainPage(); // Initialize the variable
  }

    TabBar get _tabBar => TabBar(
        tabs: [
        
               Tab(text: 'Deeds'),
               Tab(text: 'Habits'),
               Tab(text: 'Events'),
        ],
      );


  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Column(
        children: [
          // Profile Header
        
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            //padding: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image path
                  radius: 20,
                  //radius: 25,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                Text(
                  'Deeds',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'cursive',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.emoji_events, color: Colors.amber),
                    SizedBox(width: 8),
                    Icon(Icons.attach_money, color: Colors.pinkAccent),
                  ],
            ),
          ],
         ),
          ),
        ],
          ),
          
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: const Color.fromARGB(255, 178, 185, 228),
              child: _tabBar,
            ),
          ),
        ),
    
      body: TabBarView(
                  //color: Colors.white,

        //controller: _tabController,
        children: [
          DeedsTab(),
          HabitsTab(),
          EventsTab(),
        ],
      ),
      ),  
    );
  }
}


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

}
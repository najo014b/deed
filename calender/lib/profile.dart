import 'package:flutter/material.dart';
import 'main.dart';
import 'gameer.dart';
import 'communityys.dart';
import 'homepage.dart';

/*class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenstate createState() => ProfileScreenstate();
}
*/
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile Header
          Container(
            color: Color(0xFFDBCFEA), // Light purple background
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    Icon(Icons.settings, color: Colors.black),
                  ],
                ),
                SizedBox(height: 20),
                
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("posts", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text("0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("followers", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text("0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("following", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Login/Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // Define login/sign up action
                  },
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.pinkAccent,
                  ),
                  child: Text("LOG IN/SIGN UP", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          // Menu List
          Expanded(
            child: ListView(
              children: [
                
                buildMenuItem1(context,"Home", icon: Icons.home,destination: MainPage()),
                buildMenuItem("Events/Calendar", icon: Icons.calendar_today),
                buildMenuItem1(context,"Community", icon: Icons.people,destination: CommunityScreen()),
                buildMenuItem1(context,"Games", icon: Icons.videogame_asset,destination: GameScreen()),
                Divider(),
                buildMenuItem("FAQs"),
                buildMenuItem("ABOUT US"),
                buildMenuItem("TERMS OF USE"),
                buildMenuItem("PRIVACY POLICY"),
                buildMenuItem("COMPLAINTS"),
              ],
            ),
          ),

          // Bottom Copyright Text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "ALL COPYRIGHT RESERVED TO Deeds",
              style: TextStyle(fontSize: 10, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),


    );
  }

  // Helper method to build menu items
  Widget buildMenuItem(String title, {IconData? icon}) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      leading: icon != null ? Icon(icon) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
       // MainPage.of(HomePage());
        // Define your navigation or action here
      },
    );
  }
}


  Widget buildMenuItem1(BuildContext context, String title, {IconData? icon, Widget? destination}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      onTap: () {

        //MainPage.of(context).setSe
        // Navigate to the destination if it's provided
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
    );
  }

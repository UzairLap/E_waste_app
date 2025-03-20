import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/pickup_card.dart';
import '../widgets/reward_progress.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📌 Schedule Pickup Section
            PickupCard(),

            SizedBox(height: 20),

            // 📌 Recycling Progress
            RewardProgress(),

            SizedBox(height: 20),

            // 📌 Quick Access Buttons
            Text("Quick Access", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _quickAccessButton(context, FontAwesomeIcons.recycle, "Recycle", Colors.blue, '/recycle'),
                _quickAccessButton(context, FontAwesomeIcons.trophy, "Rewards", Colors.orange, '/rewards'),
                _quickAccessButton(context, FontAwesomeIcons.book, "Learn", Colors.green, '/learn'),
              ],
            ),
          ],
        ),
      ),

      // 📌 Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _quickAccessButton(BuildContext context, IconData icon, String label, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            radius: 30,
            child: Icon(icon, color: color, size: 30),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

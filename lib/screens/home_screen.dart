// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:animate_do/animate_do.dart';
// import '../widgets/bottom_navbar.dart';
// import '../widgets/pickup_card.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final List<Color> gradientColors = [
//     const Color(0xFF23b6e6),
//     const Color(0xFF02d39a),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1200),
//     )..forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//       child: CustomScrollView(
//       slivers: [
//       // Custom App Bar
//       SliverAppBar(
//       expandedHeight: 120.0,
//       floating: false,
//       pinned: true,
//       backgroundColor: Color(0xFF2E7D32),
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text(
//           "EcoRecycle",
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         background: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFF2E7D32),
//                 Color(0xFF1B5E20),
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(top: 30, left: 16),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 24,
//                   child: Icon(
//                     FontAwesomeIcons.leaf,
//                     color: Color(0xFF2E7D32),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.notifications_outlined, color: Colors.white),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.person_outline, color: Colors.white),
//           onPressed: () {},
//         ),
//       ],
//     ),
//
//     // Main Content
//     SliverToBoxAdapter(
//     child: Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     // Environmental Impact Meter
//     FadeInUp(
//     duration: Duration(milliseconds: 600),
//     child: Container(
//     padding: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     colors: [
//     Color(0xFF2E7D32),
//     Color(0xFF43A047),
//     ],
//     ),
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
//     BoxShadow(
//     color: Colors.green.withOpacity(0.3),
//     blurRadius: 10,
//     offset: Offset(0, 4),
//     ),
//     ],
//     ),
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     "Your Green Impact",
//     style: GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     ),
//     ),
//     SizedBox(height: 8),
//     Row(
//     children: [
//     Icon(
//     FontAwesomeIcons.leaf,
//     color: Colors.white,
//     size: 16,
//     ),
//     SizedBox(width: 6),
//     Text(
//     "500 kg",
//     style: GoogleFonts.poppins(
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     ),
//     ),
//     ],
//     ),
//     Text(
//     "Total E-Waste Recycled",
//     style: GoogleFonts.poppins(
//     fontSize: 12,
//     color: Colors.white.withOpacity(0.8),
//     ),
//     ),
//     ],
//     ),
//     TweenAnimationBuilder(
//     tween: Tween(begin: 0.0, end: 0.75),
//     duration: Duration(seconds: 2),
//     builder: (context, double value, child) {
//     return Stack(
//     alignment: Alignment.center,
//     children: [
//     SizedBox(
//     height: 80,
//     width: 80,
//     child: CircularProgressIndicator(
//     value: value,
//     strokeWidth: 8,
//     backgroundColor: Colors.white.withOpacity(0.2),
//     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//     ),
//     ),
//     Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     Text(
//     "${(value * 100).toInt()}%",
//     style: GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     ),
//     ),
//     Text(
//     "Goal",
//     style: GoogleFonts.poppins(
//     fontSize: 12,
//     color: Colors.white,
//     ),
//     ),
//     ],
//     ),
//     ],
//     );
//     },
//     ),
//     ],
//     ),
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Schedule Pickup Section
//     FadeInUp(
//     duration: Duration(milliseconds: 800),
//     child: Hero(
//     tag: 'pickup_card',
//     child: GestureDetector(
//     onTap: () => Navigator.pushNamed(context, '/pickup'),
//     child: Container(
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
//     BoxShadow(
//     color: Colors.grey.withOpacity(0.2),
//     blurRadius: 10,
//     offset: Offset(0, 4),
//     ),
//     ],
//     ),
//     child: PickupCard(),
//     ),
//     ),
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Recycling Progress Chart
//     FadeInUp(
//     duration: Duration(milliseconds: 1000),
//     child: Container(
//     padding: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
//     BoxShadow(
//     color: Colors.grey.withOpacity(0.2),
//     blurRadius: 10,
//     offset: Offset(0, 4),
//     ),
//     ],
//     ),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     "Your Recycling Trend",
//     style: GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     SizedBox(height: 16),
//     Container(
//     height: 180,
//     child: LineChart(
//     LineChartData(
//     gridData: FlGridData(
//     show: false,
//     ),
//     titlesData: FlTitlesData(
//     show: true,
//     bottomTitles: AxisTitles(
//     sideTitles: SideTitles(
//     showTitles: true,
//     getTitlesWidget: (value, meta) {
//     const titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
//     final index = value.toInt();
//     if (index >= 0 && index < titles.length) {
//     return Text(
//     titles[index],
//     style: GoogleFonts.poppins(
//     color: Colors.grey[600],
//     fontSize: 12,
//     ),
//     );
//     }
//     return Text('');
//     },
//     reservedSize: 22,
//     ),
//     ),
//     leftTitles: AxisTitles(
//     sideTitles: SideTitles(
//     showTitles: true,
//     getTitlesWidget: (value, meta) {
//     return Text(
//     '${value.toInt()} kg',
//     style: GoogleFonts.poppins(
//     color: Colors.grey[600],
//     fontSize: 12,
//     ),
//     );
//     },
//     reservedSize: 40,
//     ),
//     ),
//     topTitles: AxisTitles(
//     sideTitles: SideTitles(
//     showTitles: false,
//     ),
//     ),
//     rightTitles: AxisTitles(
//     sideTitles: SideTitles(
//     showTitles: false,
//     ),
//     ),
//     ),
//     borderData: FlBorderData(
//     show: false,
//     ),
//     minX: 0,
//     maxX: 5,
//     minY: 0,
//     maxY: 10,
//     lineBarsData: [
//     LineChartBarData(
//     spots: [
//     FlSpot(0, 3),
//     FlSpot(1, 2),
//     FlSpot(2, 5),
//     FlSpot(3, 3.5),
//     FlSpot(4, 4.5),
//     FlSpot(5, 5.5),
//     ],
//     isCurved: true,
//     gradient: LinearGradient(
//     colors: gradientColors,
//     ),
//     barWidth: 4,
//     isStrokeCapRound: true,
//     dotData: FlDotData(
//     show: true,
//     getDotPainter: (spot, percent, barData, index) {
//     return FlDotCirclePainter(
//     radius: 4,
//     color: Color(0xFF2E7D32),
//     strokeWidth: 2,
//     strokeColor: Colors.white,
//     );
//     },
//     ),
//     belowBarData: BarAreaData(
//     show: true,
//     gradient: LinearGradient(
//     colors: gradientColors
//         .map((color) => color.withOpacity(0.3))
//         .toList(),
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Recycling History
//     FadeInUp(
//     duration: Duration(milliseconds: 1200),
//     child: Container(
//     padding: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
//     BoxShadow(
//     color: Colors.grey.withOpacity(0.2),
//     blurRadius: 10,
//     offset: Offset(0, 4),
//     ),
//     ],
//     ),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Text(
//     "Recycling History",
//     style: GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     TextButton(
//     onPressed: () {},
//     child: Text(
//     "See All",
//     style: GoogleFonts.poppins(
//     color: Color(0xFF2E7D32),
//     fontWeight: FontWeight.w500,
//     ),
//     ),
//     ),
//     ],
//     ),
//     SizedBox(height: 8),
//     SlideInLeft(
//     duration: Duration(milliseconds: 800),
//     child: _historyItem(
//     "Laptop",
//     "5 Kg",
//     "Feb 20, 2025",
//     FontAwesomeIcons.laptop,
//     ),
//     ),
//     Divider(),
//     SlideInLeft(
//     duration: Duration(milliseconds: 950),
//     child: _historyItem(
//     "Mobile Phones",
//     "2 Kg",
//     "Jan 10, 2025",
//     FontAwesomeIcons.mobileScreen,
//     ),
//     ),
//     Divider(),
//     SlideInLeft(
//     duration: Duration(milliseconds: 1100),
//     child: _historyItem(
//     "Wires & Cables",
//     "3 Kg",
//     "Dec 5, 2024",
//     FontAwesomeIcons.plug,
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Environmental Impact Stats
//     FadeInUp(
//     duration: Duration(milliseconds: 1400),
//     child: Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Environmental Impact",
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _impactIndicator(
//                 "CO₂ Reduced",
//                 "120 kg",
//                 FontAwesomeIcons.cloudMeatball,
//                 Colors.blue,
//               ),
//               _impactIndicator(
//                 "Water Saved",
//                 "350 L",
//                 FontAwesomeIcons.droplet,
//                 Colors.cyan,
//               ),
//               _impactIndicator(
//                 "Energy Saved",
//                 "75 kWh",
//                 FontAwesomeIcons.bolt,
//                 Colors.amber,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//     ),
//
//       SizedBox(height: 24),
//
//       // Quick Access Section
//       FadeInUp(
//         duration: Duration(milliseconds: 1600),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Quick Access",
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _quickAccessButton(
//                   context,
//                   FontAwesomeIcons.recycle,
//                   "Recycle",
//                   Colors.blue,
//                   '/recycle',
//                 ),
//                 _quickAccessButton(
//                   context,
//                   FontAwesomeIcons.trophy,
//                   "Rewards",
//                   Colors.orange,
//                   '/rewards',
//                 ),
//                 _quickAccessButton(
//                   context,
//                   FontAwesomeIcons.book,
//                   "Learn",
//                   Colors.green,
//                   '/learn',
//                 ),
//                 _quickAccessButton(
//                   context,
//                   FontAwesomeIcons.shop,
//                   "EcoStore",
//                   Colors.purple,
//                   '/store',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       SizedBox(height: 24),
//
//       // Eco-Tips Card
//       FadeInUp(
//         duration: Duration(milliseconds: 1800),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             FontAwesomeIcons.lightbulb,
//                             color: Colors.amber,
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             "Eco Tip of the Day",
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "Did you know that recycling one smartphone saves enough energy to power a laptop for 44 hours?",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             "More Tips",
//                             style: GoogleFonts.poppins(
//                               color: Color(0xFF2E7D32),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//
//       SizedBox(height: 24),
//
//       // Community Impact
//       FadeInUp(
//         duration: Duration(milliseconds: 2000),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Community Impact",
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF2E7D32).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Your City Rank",
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(
//                                 FontAwesomeIcons.medal,
//                                 color: Colors.amber,
//                                 size: 20,
//                               ),
//                               SizedBox(width: 6),
//                               Text(
//                                 "#3",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF2E7D32),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 12),
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF2E7D32).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "City Total E-Waste",
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(
//                                 FontAwesomeIcons.users,
//                                 color: Color(0xFF2E7D32),
//                                 size: 20,
//                               ),
//                               SizedBox(width: 6),
//                               Text(
//                                 "2,450 kg",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF2E7D32),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       SizedBox(height: 40),
//     ],
//     ),
//     ),
//     ),
//       ],
//       ),
//       ),
//       bottomNavigationBar: BottomNavBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.pushNamed(context, '/pickup'),
//         backgroundColor: Color(0xFF2E7D32),
//         child: Icon(Icons.add),
//         tooltip: 'Schedule Pickup',
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
//
//   Widget _impactIndicator(String label, String value, IconData icon, Color color) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: color,
//             size: 24,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 12,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _quickAccessButton(BuildContext context, IconData icon, String label, Color color, String route) {
//     return InkWell(
//       onTap: () => Navigator.pushNamed(context, route),
//       borderRadius: BorderRadius.circular(12),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: color.withOpacity(0.2),
//                   blurRadius: 6,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Icon(
//               icon,
//               color: color,
//               size: 28,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w500,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _historyItem(String itemName, String weight, String date, IconData icon) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Color(0xFF2E7D32).withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(
//           icon,
//           color: Color(0xFF2E7D32),
//         ),
//       ),
//       title: Text(
//         itemName,
//         style: GoogleFonts.poppins(
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       subtitle: Text(
//         date,
//         style: GoogleFonts.poppins(
//           fontSize: 12,
//           color: Colors.grey[600],
//         ),
//       ),
//       trailing: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//         decoration: BoxDecoration(
//           color: Color(0xFF2E7D32).withOpacity(0.1),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           weight,
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF2E7D32),
//           ),
//         ),
//       ),
//     );
//   }
// }
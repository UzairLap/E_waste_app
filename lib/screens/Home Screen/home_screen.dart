import 'package:flutter/material.dart';
import 'app_bar.dart'; // Import your CollapsibleAppBar file
import 'your_impact.dart'; // Import your YourImpactSection file
import '../../widgets/pickup_card.dart'; // Import the enhanced button we just created
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  int _currentIndex = 0;
  late AnimationController _animationController;
  bool _isControllerInitialized = false; // Add a flag to track initialization

  // Sample data for the impact section
  final double _totalEWasteRecycled = 75.6; // kg
  final int _treesSaved = 12;
  final double _waterSaved = 4550.0; // liters
  final double _energySaved = 341.5; // kWh
  final double _co2Reduced = 125.8; // kg

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
      setState(() {});
    });
    _isControllerInitialized = true; // Mark the controller as initialized
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  void _onNotificationTap() {
    // Handle notification tap
    print('Notification tapped');
  }

  void _onProfileTap() {
    // Handle profile tap
    print('Profile tapped');
  }

  void _navigateToPickupForm() {
    // Navigate to pickup details form
    print('Navigating to pickup form');
    // Here we're setting the bottom nav index to the schedule pickup tab (2)
    setState(() {
      _currentIndex = 2;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Play animation when tab changes
    if (_isControllerInitialized) {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show the home content if the current index is 0
    final bool showHomeContent = _currentIndex == 0;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Home Tab
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 150.0,
                collapsedHeight: 60.0,
                pinned: true,
                flexibleSpace: CollapsibleAppBar(
                  userName: 'Shantanu Kulkarni',
                  appName: 'EcoApp',
                  userPoints: 1200,
                  userStreak: 7,
                  isCollapsed: _scrollOffset > 60,
                  scrollController: _scrollController,
                  onNotificationTap: _onNotificationTap,
                  onProfileTap: _onProfileTap,
                  // userAvatarUrl: 'https://example.com/avatar.png',
                  scrollOffset: _scrollOffset,
                ),
              ),
              // Add YourImpactSection as the first content item
              SliverToBoxAdapter(
                child: YourImpactSection(
                  totalEWasteRecycled: _totalEWasteRecycled,
                  treesSaved: _treesSaved,
                  waterSaved: _waterSaved,
                  energySaved: _energySaved,
                  co2Reduced: _co2Reduced,
                ),
              ),
              // Add Enhanced Schedule Pickup Button Section
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 32, 10, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header text with icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.recycling,
                            color: Color(0xFF10B981),
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Ready to recycle your e-waste?',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Subheader text
                      Text(
                        'We\'ll pick up your electronics from your doorstep',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Enhanced Schedule Pickup Button
                      Center(
                        child: Container(
                          // Add subtle elevation to the button container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: SchedulePickupButton(
                            onPressed: _navigateToPickupForm,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                        ),
                      ),
                      // Details below button
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 18,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Earn rewards with each recycling pickup',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider for visual separation
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 8),
                        child: Divider(
                          color: Colors.grey.withOpacity(0.3),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Other content items
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Content Item $index',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  childCount: 20, // Adjust the number of items as needed
                ),
              ),
            ],
          ),

          // Location Tab
          Center(child: Text('Location Page', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600))),

          // Schedule Pickup Tab
          Center(child: Text('Schedule Pickup Page', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600))),

          // Learn Tab
          Center(child: Text('Learn Page', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600))),

          // Community Tab
          Center(child: Text('Community Page', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600))),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Bottom Navigation Bar
            SalomonBottomBar(
              currentIndex: _currentIndex == 2 ? 0 : _currentIndex,
              onTap: (index) {
                // Don't handle center button tap here
                if (index != 2) {
                  _onBottomNavTap(index);
                }
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: const Color(0xFF4CAF50),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.location_on_outlined),
                  activeIcon: const Icon(Icons.location_on),
                  title: const Text("Location"),
                  selectedColor: const Color(0xFF4CAF50),
                ),
                // Center button placeholder (empty)
                SalomonBottomBarItem(
                  icon: const SizedBox(width: 0),
                  title: const SizedBox(width: 0),
                  selectedColor: Colors.transparent,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.menu_book_outlined),
                  activeIcon: const Icon(Icons.menu_book),
                  title: const Text("Learn"),
                  selectedColor: const Color(0xFF4CAF50),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.people_outline),
                  activeIcon: const Icon(Icons.people),
                  title: const Text("Community"),
                  selectedColor: const Color(0xFF4CAF50),
                ),
              ],
            ),

            // Center Floating Action Button
            GestureDetector(
              onTap: () {
                _onBottomNavTap(2); // Index 2 is for Schedule Pickup

                // Animate the button
                if (_isControllerInitialized) {
                  _animationController.reset();
                  _animationController.forward();
                }
              },
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 1 + (0.1 * value),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
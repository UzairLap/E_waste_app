import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, -3),
            spreadRadius: 1,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      // Add height constraint to ensure consistent size
      height: 80,
      child: SalomonBottomBar(
        currentIndex: widget.currentIndex,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        onTap: (index) {
          widget.onTap(index);

          // Animate button on tab change
          _controller.reset();
          _controller.forward();
        },
        items: [
          _buildNavItem(Icons.home_outlined, Icons.home, "Home", 0),
          _buildNavItem(Icons.location_on_outlined, Icons.location_on, "Location", 1),
          _buildNavItem(Icons.menu_book_outlined, Icons.menu_book, "Learn", 2),
          _buildNavItem(Icons.people_outline, Icons.people, "Community", 3),
        ],
      ),
    );
  }

  SalomonBottomBarItem _buildNavItem(
      IconData icon, IconData activeIcon, String title, int index) {
    return SalomonBottomBarItem(
      icon: Icon(icon, size: 24),
      activeIcon: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.currentIndex == index ? _scaleAnimation.value : 1.0,
            child: Icon(activeIcon, size: 26),
          );
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      selectedColor: const Color(0xFF4CAF50),
      unselectedColor: Colors.grey.shade600,
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _fabController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  final List<Widget> _pages = [
    const HomePage(),
    const LocationPage(),
    const SchedulePickupPage(),
    const LearnPage(),
    const CommunityPage(),
  ];

  @override
  void initState() {
    super.initState();
    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.elasticOut),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  void _showSchedulePickup() {
    setState(() {
      // Navigate to the Schedule Pickup page
      _currentIndex = 2;
    });

    // Animate the FAB
    _fabController.reset();
    _fabController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Important: allows content to go behind the bottom navigation bar
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      // Improved floating action button with better animations
      floatingActionButton: AnimatedBuilder(
        animation: _fabController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotateAnimation.value,
              child: FloatingActionButton(
                onPressed: _showSchedulePickup,
                backgroundColor: const Color(0xFF4CAF50),
                elevation: 6,
                child: const Icon(
                  Icons.add,
                  size: 28,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        // Add padding to avoid FAB overlap
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomBottomNavBar(
          currentIndex: _currentIndex < 4 ? _currentIndex : 0, // Adjust index if out of range
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

// Placeholder page classes remain the same
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('Home Page'));
}

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('Location Page'));
}

class SchedulePickupPage extends StatelessWidget {
  const SchedulePickupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('Schedule Pickup'));
}

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('Learn Page'));
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Community Page'));
}
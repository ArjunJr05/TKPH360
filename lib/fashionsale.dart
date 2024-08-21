import 'package:Journix/nav_pages/bagpage.dart';
import 'package:Journix/nav_pages/profilepage.dart';
import 'package:Journix/nav_pages/shoppage.dart';
import 'package:flutter/material.dart';

class FashionSalePage extends StatefulWidget {
  @override
  _FashionSalePageState createState() => _FashionSalePageState();
}

class _FashionSalePageState extends State<FashionSalePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: screenHeight/8,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Container(
          height: 45,
          width: screenWidth,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Destination',
              prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),

    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Weekend Getaways', onPressed: () {}),
            _buildHorizontalList1(screenWidth),

            _buildSectionHeader('Recommended', onPressed: () {}),
            _buildHorizontalList2(screenWidth),

            _buildSectionHeader('Popular Destinations', onPressed: () {}),
            _buildHorizontalList3(screenWidth),
          ],
        ),
      ),

    
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FashionSalePage()));
              },
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ShopPage()));
              },
              child: const Icon(Icons.explore),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BookingScreen()));
              },
              child: const Icon(Icons.bookmark),
            ),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage()));
              },
              child: const Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
  Widget _buildSectionHeader(String title, {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList1(double screenWidth) {
    return Container(
      height: screenWidth / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDestinationCard('assets/images/auroville.jpg', 'Auroville'),
          _buildDestinationCard('assets/images/mk_temple.jpg', 'Manakula vinayagar temple'),
          _buildDestinationCard('assets/images/pichavaram.jpg', 'Pichavaram'),
        ],
      ),
    );
  }
  
  Widget _buildHorizontalList2(double screenWidth) {
    return Container(
      height: screenWidth / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDestinationCard('assets/images/goa.jpg', 'Goa'),
          _buildDestinationCard('assets/images/munnar.jpg', 'Munnar'),
          _buildDestinationCard('assets/images/ladakh.jpg', 'Ladakh'),
        ],
      ),
    );
  }
  
  Widget _buildHorizontalList3(double screenWidth) {
    return Container(
      height: screenWidth / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDestinationCard('assets/images/bhu.jpg', 'Bhubaneshwar'), 
          _buildDestinationCard('assets/images/maldives.jpg', 'Maldives'),
          _buildDestinationCard('assets/images/bt.jpg', 'Brihadeeswara temple'),
        ],
      ),
    );
  }
  Widget _buildDestinationCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Metropolis'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
     
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmAssist', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          // Bell Icon with Popup Menu
          PopupMenuButton<String>(
            icon: Icon(Icons.notifications, color: Colors.white), // Bell icon
            onSelected: (String value) {
              // Handle menu item selection
              if (value == 'notifications') {
                // Navigate to notifications screen
                print('View Notifications');
              } else if (value == 'settings') {
                // Navigate to settings screen
                print('Open Settings');
              } else if (value == 'help') {
                // Navigate to help screen
                print('Get Help');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'notifications',
                child: Text('View Notifications'),
              ),
              PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
              PopupMenuItem<String>(
                value: 'help',
                child: Text('Help'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Parallax Header
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/farm_header.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Your Farming Assistant',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // AI Chatbot Section
            _buildAIChatbotSection(context),
            SizedBox(height: 20),
            // Feature Cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.camera_alt,
                    title: 'Scan Plant',
                    subtitle: 'Detect diseases in seconds',
                    onTap: () {
                      Navigator.pushNamed(context, '/scan');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildFeatureCard(
                    context,
                    icon: Icons.analytics,
                    title: 'Disease Outbreak',
                    subtitle: 'Stay updated on local outbreaks',
                    onTap: () {
                      Navigator.pushNamed(context, '/outbreak');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildFeatureCard(
                    context,
                    icon: Icons.people,
                    title: 'Community Help',
                    subtitle: 'Connect with experts and farmers',
                    onTap: () {
                      Navigator.pushNamed(context, '/community');
                    },
                  ),
                ],
              ),
            ),
            // News Feed Section
            _buildNewsFeedSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, {
        required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.green),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsFeedSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest News & Tips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              final news = newsItems[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Published on: ${news.date}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // AI Chatbot Section
  Widget _buildAIChatbotSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Ask me anything about farming!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the AI Chatbot screen
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: Text('Start Chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Mock News Data
class NewsItem {
  final String title;
  final String description;
  final String date;

  NewsItem({
    required this.title,
    required this.description,
    required this.date,
  });
}

final List<NewsItem> newsItems = [
  NewsItem(
    title: '5 Tips for Healthy Crops',
    description: 'Learn how to maintain healthy crops with these simple tips.',
    date: 'March 15, 2025',
  ),
  NewsItem(
    title: 'New Organic Fertilizers',
    description: 'Discover the latest organic fertilizers for sustainable farming.',
    date: 'March 10, 2025',
  ),
  NewsItem(
    title: 'Weather Impact on Crops',
    description: 'Understand how weather changes can affect your crops and how to adapt.',
    date: 'March 5, 2025',
  ),
];
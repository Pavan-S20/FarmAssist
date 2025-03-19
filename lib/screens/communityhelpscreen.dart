import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community & Help', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.green,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Forum'),
                Tab(text: 'Ask Expert'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Forum Tab
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Forum Thread $index'),
                        subtitle: Text('Upvotes: ${index * 10}'),
                      );
                    },
                  ),

                  // Ask Expert Tab
                  Center(
                    child: Text('Chat with an Expert'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
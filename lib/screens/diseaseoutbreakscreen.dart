import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiseaseOutbreakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Outbreak', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Weather Data
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Weather Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('🌡 28°C'),
                        Text('💧 60%'),
                        Text('🌧 10mm'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // AI Prediction
            Text('Disease Spread Risk: High', style: TextStyle(color: Colors.red, fontSize: 18)),
            SizedBox(height: 20),

            // Map View (Placeholder)
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Text('Map View')),
            ),
            SizedBox(height: 20),

            // Prevention Tips
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Prevention Tips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('- Use resistant varieties\n- Practice crop rotation'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
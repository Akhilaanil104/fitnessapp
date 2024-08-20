
import 'package:fitnessapp1/homepage.dart';
import 'package:flutter/material.dart';



class AppointmentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.lightGreen.shade100, Colors.green.shade100],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage2(),));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Health Risk Assessment',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.timer, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            '4 min',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Hero(
                          tag: 'man_sitting',
                          child: Image.asset(
                            'assets/images/health.png',
                            height: 200,
                            width: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What do you get?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FeatureIcon(title: 'Key Body Vitals', icon: Icons.favorite),
                      FeatureIcon(title: 'Posture Analysis', icon: Icons.accessibility_new),
                      FeatureIcon(title: 'Body Composition', icon: Icons.monitor_weight),
                      FeatureIcon(title: 'Instant Reports', icon: Icons.report),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'How we do it?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Hero(
                      tag: 'man_exercising',
                      child: Image.asset(
                        'assets/images/health1.png',
                        height: 200,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'We do not store or share your personal data',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('1. Ensure that you are in a well-lit space'),
                          Text('2. Allow camera access and place your device against a stable object or wall'),
                          Text('3. Avoid wearing baggy clothes'),
                          Text('4. Make sure you exercise as per the instruction provided by the trainer'),
                          Text('5. Watch the short preview before each exercise'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Benefits',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Holistic Insight into Physical Health Across Multiple Key Areas\n'
                    '• Enables Early Interventions, Improving Preventive Care and Health Outcomes\n'
                    '• Tailored Lifestyle and Health Recommendations Based on Detailed Assessment Results',
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                      label: Text('Start Assessment'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                    ),
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

class FeatureIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  FeatureIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.green),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

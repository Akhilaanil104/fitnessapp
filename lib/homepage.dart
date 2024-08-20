

import 'package:fitnessapp1/appoinment.dart';
import 'package:fitnessapp1/assesementtest1.dart';
import 'package:flutter/material.dart';

 // Import your AssessmentPage

class Homepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      initialIndex: 0, // Default to "My Assessments" tab
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Hello Jane',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person_outline, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Assessments'),
              Tab(text: 'My Appointments'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          children: [
            Test1(),
            // Homepage3(), // Replace with your AssessmentPage widget
            AppointmentPage(), // Replace with your AppointmentPage widget
          ],
        ),
      ),
    );
  }
}

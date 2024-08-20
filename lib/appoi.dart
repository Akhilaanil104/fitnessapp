import 'package:fitnessapp1/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final FirebaseService _firebaseService = FirebaseService();
  late Future<List<Map<String, dynamic>>> _challenges;
  late Future<List<Map<String, dynamic>>> _workoutRoutines;

  @override
  void initState() {
    super.initState();
    _challenges = _firebaseService.getChallenges();
    _workoutRoutines = _firebaseService.getWorkoutRoutines();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointments Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: AppointmentCard(
                            color: Colors.blue[100]!,
                            title: "Cancer 2nd Opinion",
                            icon: Icons.health_and_safety,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: AppointmentCard(
                            color: Colors.purple[100]!,
                            title: "Physiotherapy Appointment",
                            icon: Icons.healing,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: AppointmentCard(
                            color: Colors.orange[100]!,
                            title: "Fitness Appointment",
                            icon: Icons.fitness_center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Challenges Section
              Text(
                "Challenges",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _challenges,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text("No challenges available.");
                  }

                  var challenge = snapshot.data!.first;
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                challenge['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                challenge['subtitle'],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.green[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: challenge['progress'] / 100,
                                backgroundColor: Colors.green[300],
                                color: Colors.green[700],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${challenge['progress']} / 100 Complete",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.green[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Image.asset(
                          challenge['imageUrl'],
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),

              // Workout Routines Section
              Text(
                "Workout Routines",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _workoutRoutines,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text("No workout routines available.");
                  }

                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: snapshot.data!.map((routine) {
                      return WorkoutRoutineCard(
                        title: routine['title'],
                        subtitle: routine['subtitle'],
                        difficulty: routine['difficulty'],
                        imageUrl: routine['imageUrl'],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;

  AppointmentCard({required this.color, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutRoutineCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String difficulty;
  final String imageUrl;

  WorkoutRoutineCard({
    required this.title,
    required this.subtitle,
    required this.difficulty,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(imageUrl, height: 80, fit: BoxFit.contain),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Difficulty: $difficulty',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

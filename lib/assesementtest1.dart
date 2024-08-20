// import 'package:fitnessapp1/appoi.dart';
// import 'package:fitnessapp1/assessmentdetails.dart';
// import 'package:fitnessapp1/firebase_service.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart';



// class Test1 extends StatefulWidget {
//   @override
//   _Test1State createState() => _Test1State();
// }

// class _Test1State extends State<Test1> {
//   final FirebaseService _firebaseService = FirebaseService();
//   late Future<List<Map<String, dynamic>>> _assessments;
//   late Future<List<Map<String, dynamic>>> _challenges;
//   late Future<List<Map<String, dynamic>>> _workoutRoutines;

//   @override
//   void initState() {
//     super.initState();
//     _assessments = _firebaseService.getAssessments();
//     _challenges = _firebaseService.getChallenges();
//     _workoutRoutines = _firebaseService.getWorkoutRoutines();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(screenWidth * 0.04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _assessments,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Text("No assessments available.");
//                   }

//                   return Container(
//                      padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                     child: Column(
                      
//                       children: snapshot.data!.map((assessment) {
//                         return _buildAssessmentCard(
//                           title: assessment['title'],
//                           description: assessment['description'],
//                           color: Colors.orange[100]!,
//                           imageUrl: assessment['imageUrl'],
//                           screenWidth: screenWidth,
//                           context: context,
//                           destinationPage: AppointmentDetails(),
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 },
//               ),

//               SizedBox(height: screenHeight * 0.02),
//               _buildSectionTitle('Challenges'),
//               FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _challenges,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Text("No challenges available.");
//                   }

//                   return Column(
//                     children: snapshot.data!.map((challenge) {
//                       return ChallengeCard(
//                         challengeTitle: challenge['title'],
//                         challengeSubtitle: challenge['subtitle'],
//                         progress: challenge['progress'],
//                         progressText: challenge['progressText'],
//                         imageUrl: challenge['imageUrl'],
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),

//               SizedBox(height: screenHeight * 0.02),
//               _buildSectionTitle('Workout Routines'),
//               FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _workoutRoutines,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Text("No workout routines available.");
//                   }

//                   return CarouselSlider(
//                     options: CarouselOptions(
//                       height: 180,
//                       enlargeCenterPage: true,
//                       enableInfiniteScroll: false,
//                     ),
//                     items: snapshot.data!.map((routine) {
//                       return WorkoutRoutineCard(
//                         title: routine['title'],
//                         subtitle: routine['subtitle'],
//                         difficulty: routine['difficulty'],
//                         imageUrl: routine['imageUrl'],
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Row(
//             children: [
//               Text(
//                 'View All',
//                 style: TextStyle(color: Colors.blue),
//               ),
//               Icon(
//                 Icons.arrow_forward,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAssessmentCard({
//     required String title,
//     required String description,
//     required Color color,
//     required String imageUrl,
//     required double screenWidth,
//     required BuildContext context,
//     required Widget destinationPage,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(screenWidth * 0.04),
//       margin: EdgeInsets.only(bottom: screenWidth * 0.04),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: screenWidth * 0.2,
//             height: screenWidth * 0.2,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: AssetImage(imageUrl),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(width: screenWidth * 0.04),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: screenWidth * 0.02),
//                 Text(
//                   description,
//                   style: GoogleFonts.poppins(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(height: screenWidth * 0.02),
//                 Row(
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => destinationPage),
//                         );
//                       },
//                       child: Text(
//                         'Start',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ),
//                     Icon(
//                       Icons.play_circle_fill,
//                       color: Colors.blue,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChallengeCard extends StatelessWidget {
//   final String challengeTitle;
//   final String challengeSubtitle;
//   final double progress;
//   final String progressText;
//   final String imageUrl;

//   ChallengeCard({
//     required this.challengeTitle,
//     required this.challengeSubtitle,
//     required this.progress,
//     required this.progressText,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.green[100],
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   challengeTitle,
//                   style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   challengeSubtitle,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     color: Colors.green[700],
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 LinearProgressIndicator(
//                   value: progress,
//                   backgroundColor: Colors.green[300],
//                   color: Colors.green[700],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   progressText,
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     color: Colors.green[700],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 16),
//           Image.asset(
//             imageUrl,
//             height: 80,
//             fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WorkoutRoutineCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String difficulty;
//   final String imageUrl;

//   WorkoutRoutineCard({
//     required this.title,
//     required this.subtitle,
//     required this.difficulty,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Image.asset(imageUrl, height: 80, fit: BoxFit.contain),
//           SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: GoogleFonts.poppins(fontSize: 16),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Difficulty: $difficulty',
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }















import 'package:fitnessapp1/assessmentdetails.dart';
import 'package:fitnessapp1/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Test1 extends StatefulWidget {
  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  final FirebaseService _firebaseService = FirebaseService();
  late Future<List<Map<String, dynamic>>> _assessments;
  late Future<List<Map<String, dynamic>>> _challenges;
  late Future<List<Map<String, dynamic>>> _workoutRoutines;

  @override
  void initState() {
    super.initState();
    _assessments = _firebaseService.getAssessments();
    _challenges = _firebaseService.getChallenges();
    _workoutRoutines = _firebaseService.getWorkoutRoutines();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _assessments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text("No assessments available.");
                  }

                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: snapshot.data!.map((assessment) {
                        return _buildAssessmentCard(
                          title: assessment['title'],
                          description: assessment['description'],
                          color: Colors.orange[100]!,
                          imageUrl: assessment['imageUrl'],
                          screenWidth: screenWidth,
                          context: context,
                          destinationPage: AppointmentDetails(),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02),
              _buildSectionTitle('Challenges'),
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

                  return Column(
                    children: snapshot.data!.map((challenge) {
                      return ChallengeCard(
                        challengeTitle: challenge['title'],
                        challengeSubtitle: challenge['subtitle'],
                        progress: challenge['progress'],
                        progressText: challenge['progressText'],
                        imageUrl: challenge['imageUrl'],
                      );
                    }).toList(),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02),
              _buildSectionTitle('Workout Routines'),
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

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'View All',
                style: TextStyle(color: Colors.blue),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAssessmentCard({
    required String title,
    required String description,
    required Color color,
    required String imageUrl,
    required double screenWidth,
    required BuildContext context,
    required Widget destinationPage,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'assessment_image', // Ensure this tag matches the one in the destination screen
              child: Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => destinationPage),
                          );
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.blue,
                      ),
                    ],
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

class ChallengeCard extends StatelessWidget {
  final String challengeTitle;
  final String challengeSubtitle;
  final double progress;
  final String progressText;
  final String imageUrl;

  ChallengeCard({
    required this.challengeTitle,
    required this.challengeSubtitle,
    required this.progress,
    required this.progressText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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
                  challengeTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  challengeSubtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.green[300],
                  color: Colors.green[700],
                ),
                SizedBox(height: 8),
                Text(
                  progressText,
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
            imageUrl,
            height: 80,
            fit: BoxFit.contain,
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
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                'Difficulty: $difficulty',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

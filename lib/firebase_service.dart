// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Map<String, dynamic>>> getAssessments() async {
//     QuerySnapshot snapshot = await _firestore.collection('assessments').get();
//     return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//   }
//   Future<List<Map<String, dynamic>>> getAppointments() async {
//     try {
//       QuerySnapshot snapshot = await _firestore.collection('appointments').get();
//       return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//     } catch (e) {
//       throw Exception('Failed to load appointments: $e');
//     }
//   }

//   Future<List<Map<String, dynamic>>> getChallenges() async {
//     QuerySnapshot snapshot = await _firestore.collection('challenges').get();
//     return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//   }

//   Future<List<Map<String, dynamic>>> getWorkoutRoutines() async {
//     QuerySnapshot snapshot = await _firestore.collection('workout_routines').get();
//     return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//   }

//   Future<Map<String, dynamic>> getAppointmentDetails(String appointmentId) async {
//     try {
//       DocumentSnapshot doc = await _firestore.collection('appointments').doc(appointmentId).get();
//       if (doc.exists) {
//         return doc.data() as Map<String, dynamic>;
//       } else {
//         throw Exception('Appointment not found');
//       }
//     } catch (e) {
//       throw Exception('Failed to load appointment details: $e');
//     }
//   }

//   // Fetch features related to a specific appointment
//   Future<List<Map<String, dynamic>>> getFeatures(String appointmentId) async {
//     try {
//       QuerySnapshot query = await _firestore.collection('appointments').doc(appointmentId).collection('features').get();
//       return query.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//     } catch (e) {
//       throw Exception('Failed to load features: $e');
//     }

    
//   }
   
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all assessments
  Future<List<Map<String, dynamic>>> getAssessments() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('assessments').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Failed to load assessments: $e');
    }
  }

  // Fetch all appointments
  Future<List<Map<String, dynamic>>> getAppointments() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('appointments').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Failed to load appointments: $e');
    }
  }

  // Fetch all challenges
  Future<List<Map<String, dynamic>>> getChallenges() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('challenges').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Failed to load challenges: $e');
    }
  }

  // Fetch all workout routines
  Future<List<Map<String, dynamic>>> getWorkoutRoutines() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('workout_routines').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Failed to load workout routines: $e');
    }
  }

  // Fetch details of a specific appointment
  Future<Map<String, dynamic>> getAppointmentDetails(String appointmentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('appointments').doc(appointmentId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        throw Exception('Appointment not found');
      }
    } catch (e) {
      throw Exception('Failed to load appointment details: $e');
    }
  }

  // Fetch features related to a specific appointment
  Future<List<Map<String, dynamic>>> getFeatures(String appointmentId) async {
    try {
      QuerySnapshot query = await _firestore.collection('appointments').doc(appointmentId).collection('features').get();
      return query.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Failed to load features: $e');
    }
  }

  Future<Map<String, dynamic>> fetchAppointmentDetails(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('appointments').doc(documentId).get();
      return doc.data() as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to fetch appointment details: $e');
    }
  }
}


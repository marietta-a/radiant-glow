import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
   late final String? firstName;
   late final String? lastName;
   late final String userName;
   late final DateTime? dob;
   late final List<String>? goals;
   late final double? height;
   late final double? weight;
   late final String? role;

   UserProfile({
     required this.userName,
     this.firstName,
     this.lastName,
     this.dob,
     this.goals,
     this.height,
     this.weight,
     this.role
   });

   

  factory UserProfile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserProfile(
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      userName: data?['userName'],
      dob: data?['dob'],
      height: data?['height'],
      weight: data?['weight'],
      goals:
          data?['goals'] is Iterable ? List.from(data?['goals']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "firstName": firstName,
      if (lastName != null) "lastName": lastName,
      "userName": userName,
      if (dob != null) "dob": dob,
      if (height != null) "height": height,
      if (weight != null) "weight": weight,
      if (goals != null) "goals": goals,
    };
  }
}
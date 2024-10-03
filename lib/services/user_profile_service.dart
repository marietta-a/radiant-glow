import 'package:radiantglow/helpers/enums.dart';
import 'package:radiantglow/models/user_profile.dart';
import 'package:radiantglow/persistence/data_context.dart';
import 'package:radiantglow/services/service_base.dart';

String userCollection = CollectionTypes.userProfiles.name;
final ref = db.collection(userCollection).withConverter(
      fromFirestore: UserProfile.fromFirestore,
      toFirestore: (UserProfile profile, _) => profile.toFirestore(),
);


hasUsers(){
  return itemCount(CollectionTypes.userProfiles) > 0;
}
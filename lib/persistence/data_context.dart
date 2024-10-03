import 'package:cloud_firestore/cloud_firestore.dart';

 FirebaseFirestore db = FirebaseFirestore.instance;

 initDb() {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
 }
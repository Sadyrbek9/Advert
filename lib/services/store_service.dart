import 'package:advert/models/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService {
  final db = FirebaseFirestore.instance;
  Future<void> informationSave (Information information) async {
    await db.collection("Advert").add(information.toMap());
  }
}
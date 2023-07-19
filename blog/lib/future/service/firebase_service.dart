import 'package:cloud_firestore/cloud_firestore.dart';

class MyService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Object?>> getData(String collection) {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection(collection).snapshots();
    return ref;
  }

  @override
  Future<void> kaydet(String collection, String name, String aciklama,
      String resim, String baslik) async {
    await firestore.collection(collection).doc(name).set(
        {"name": name, "açıklama": aciklama, "resim": resim, "başlık": baslik});
    await firestore.collection("for").doc(name).set(
        {"name": name, "açıklama": aciklama, "resim": resim, "başlık": baslik});
  }
}

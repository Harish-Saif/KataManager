import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final fire = FirebaseFirestore.instance;

  create(
      String problemTitle, String problemLink, String problemLevel, String id) {
    try {
      fire
          .collection('user')
          .doc(id)
          .set({
            'is_completed': false,
            'id': id,
            'problem_title': problemTitle,
            'problem_link': problemLink,
            'problem_level': problemLevel,
            'date': DateTime.now(),
          })
          .then((value) => print("Task Added"))
          .catchError((error) => print("Failed to add Task: $error"));
    } catch (e) {
      print(e);
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> read() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> list = [];
    try {
      final data = await fire.collection('user').get();
      print(data.docs.length);
      list = data.docs;
    } catch (e) {
      print(e);
    }
    return list;
  }

  update(String id, Map<String, dynamic> userMap) async {
    await fire.collection('user').doc(id).update(userMap);
    print('task updated');
  }

  delete(String id) async {
    await fire.collection('user').doc(id).delete();
    print('task deleted');
  }
}

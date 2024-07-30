import 'package:crud_application_firebase/display_tasks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// A DocumentSnapshot contains data read from a document in your Cloud Firestore database.
// The data can be extracted with data() or get() to get a specific field.

class ReadTask extends StatefulWidget {
  ReadTask(this.isCompletedPage, {super.key});

  final bool isCompletedPage;

  @override
  State<ReadTask> createState() => _ReadTaskState();
}

class _ReadTaskState extends State<ReadTask> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> taskList = [];

  final fire = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> read() async {
    try {
      final data = await fire.collection('user').get();
      return data.docs;
    } catch (e) {
      print(e);
      return [];
    }
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.isCompletedPage == true ? "COMPLETED" : "ALL"} TASKS',
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Error handling
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nothing to show')); // No data case
          } else {
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> taskList =
                snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                if (widget.isCompletedPage == true) {
                  if (taskList[index]['is_completed'] == true) {
                    return DisplayTasks(taskList[index], index, refresh);
                  }
                } else {
                  return DisplayTasks(taskList[index], index, refresh);
                }
              },
            );
          }
        },
      ),
    );
  }
}

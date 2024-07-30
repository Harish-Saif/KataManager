import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_application_firebase/add_task.dart';
import 'package:crud_application_firebase/database_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProblemPage extends StatelessWidget {
  SingleProblemPage(this.task, this.refresh, {super.key});

  final QueryDocumentSnapshot<Map<String, dynamic>> task;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 350,
              width: double.infinity,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/images/Data-Observability-and-Metadata-Observability-–-Same-Problem-Different-Solutions.jpg',
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 10.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Problem Title : ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      Expanded(
                          child: Text(
                        '${task['problem_title']}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Problem Link :',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            var url = task['problem_link'];
                            if (await canLaunchUrl(Uri.parse(url!))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text(
                            'Click Here',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Problem Level : ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${task['problem_level']}',
                        style: const TextStyle(
                          fontSize: 24,
                          //  color: Colors.pink,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date : ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${DateFormat.yMMMEd().format(task['date'].toDate())}',
                        style: const TextStyle(
                          fontSize: 24,
                          //color: Colors.deepOrangeAccent
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTask(task['id'],
                                        true, task['is_completed'])));
                            //Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> map = {
                              'is_completed': true,
                            };
                            String id = task['id'];
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Done'),
                                content:
                                    const Text('Challenge marked as Done '),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        DatabaseServices().update(id, map);
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text('Ok')),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Mark as Done',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            String id_to_deleted = task['id'];
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Deleted'),
                                content:
                                    Text('Challenge deleted Successfully '),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        DatabaseServices()
                                            .delete(id_to_deleted);
                                        Navigator.of(ctx).pop();
                                        Navigator.of(ctx).pop();
                                        refresh();
                                      },
                                      child: Text('Ok')),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

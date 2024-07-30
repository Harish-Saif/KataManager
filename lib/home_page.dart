import 'package:crud_application_firebase/add_task.dart';
import 'package:crud_application_firebase/completed_task.dart';
import 'package:crud_application_firebase/incompleted_task.dart';
import 'package:crud_application_firebase/read_task.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: const Text(
          'KataManager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Image.asset(
                'assets/images/c624e0_04067397f3ba46c1b587e1d30dcf16be~mv2.webp'),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepPurple[100],
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.create_outlined,
                  size: 35,
                  color: Colors.deepPurple,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTask("", false, false)));
                    },
                    child: const Text(
                      'CREATE  A NEW TASK',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.yellow[100],
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.read_more,
                  size: 35,
                  color: Colors.blueAccent[900],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => ReadTask(false)));
                    },
                    child: const Text(
                      'READ ALL TASKS',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink[200],
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.done,
                  size: 35,
                  color: Colors.green,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => CompletedTask()));
                    },
                    child: const Text(
                      'VIEW COMPLETED TASK',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.lime[100],
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.incomplete_circle,
                  size: 35,
                  color: Colors.indigo,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => IncompletedTask()));
                    },
                    child: const Text(
                      'INCOMPLETE TASKS ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

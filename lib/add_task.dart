import 'package:crud_application_firebase/database_services.dart';
import 'package:crud_application_firebase/home_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddTask extends StatelessWidget {
  const AddTask(this.id, this.flag, this.isCompleted, {super.key});

  final bool flag;
  final String id;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    TextEditingController problemTitle = TextEditingController();
    TextEditingController problemLink = TextEditingController();
    TextEditingController problemLevel = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add New Challenge',
          style: TextStyle(
            fontSize: 30,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      // backgroundColor: Colors.blue[100],
      body: Center(
        child: Container(
          width: 400,
          //   color: Colors.blue[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Title of the Problem',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: problemTitle,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Link of the Problem',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: problemLink,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Difficulty Level',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: problemLevel,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.pink[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent[100],
                  ),
                  onPressed: () {
                    var uuid = Uuid().v1();
                    String status = "added";
                    if (flag == true) // means we want to update the data
                    {
                      Map<String, dynamic> map = {
                        'is_completed': isCompleted,
                        'id': id,
                        'problem_title': problemTitle.text.toString(),
                        'problem_link': problemLink.text.toString(),
                        'problem_level': problemLevel.text.toString(),
                        'date': DateTime.now(),
                      };
                      status = 'updated';
                      print(status);
                      DatabaseServices().update(id, map);
                    } else {
                      DatabaseServices().create(
                          problemTitle.text.toString(),
                          problemLink.text.toString(),
                          problemLevel.text.toString(),
                          uuid);
                    }
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Success'),
                        content: Text('Challenge ${status} Successfully '),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                problemTitle.clear();
                                problemLink.clear();
                                problemLevel.clear();
                                if (flag == true) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              },
                              child: Text('Ok')),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                'assets/images/pngtree-online-form-survey-isolated-on-white-background-png-image_4695930.png',
                width: 400,
                height: 300,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

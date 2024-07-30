import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_application_firebase/single_problem_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayTasks extends StatelessWidget {

   DisplayTasks(this.task,this.index,this.refresh,{super.key});
   final QueryDocumentSnapshot<Map<String,dynamic>> task;
   final int index;
   final void Function() refresh;

   var  l1 = [Colors.indigo, Colors.blue, Colors.cyan,];
   var  l2 = [Colors.purple[400]!,Colors.pink[100]!, Colors.pink[200]!, ];


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:  LinearGradient(
              colors: (index % 2 == 0 ? l1 : l2),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              child: Column(
                  //mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(task['problem_title'],style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        ),
                      ),
                      // Text(task['problem_level'],style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 18,
                      //   color: Colors.black,
                      // ),)
                    ],
                  ),
                 SizedBox(height: 40,),
                  // ListTile(
                  //   trailing: Icon(Icons.arrow_circle_right_sharp),
                  //   leading: TextButton(onPressed: (){}, child: Text('Learn More ...')),
                  //   title: TextButton(
                  //       iconAlignment: IconAlignment.end,
                  //       onPressed: (){},
                  //       child: Text('Go to Problem')
                  //   )
                  //   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> SingleProblemPage(task,refresh)));
                      }, child: const Text('Learn More ...',style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Go to Problem',style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),),
                          // TextButton(
                          //     iconAlignment: IconAlignment.end,
                          //     onPressed: (){},
                          //     child: const Text('Go to Problem',style: TextStyle(
                          //       //fontWeight: FontWeight.bold,
                          //       fontSize: 15,
                          //       color: Colors.black,
                          //     ),)
                          // ),
                          IconButton(onPressed: () async {
                            var url = task['problem_link'];
                            if (await canLaunchUrl(Uri.parse(url!))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          }, icon: Icon(Icons.arrow_circle_right_sharp,color: Colors.deepPurple[50]),)
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
  }


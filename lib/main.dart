import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicName()));
          }, child: const Text('Cover Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        ),
      ),
    );
  }
}

class TopicName extends StatelessWidget {
  TopicName({Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Name'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body:
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller1,
                validator: (String? value){
                  if (value?.trim().isEmpty?? true) {
                    return 'Enter topic name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Topic',
                  border: OutlineInputBorder(),
                ),

              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherInformationPage(
                                  topic: controller1.text)));
                    }
                  },
                  child: const Icon(Icons.arrow_circle_right))
            ],
          ),
        ),
      ),
    );
  }
}

class TeacherInformationPage extends StatelessWidget {
  String? topic;
  TeacherInformationPage({required this.topic,Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Information'),
        backgroundColor: Colors.black,
      ),

      body:
      Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: TextFormField(
                controller: controller1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty?? true){
                    return 'Teacher Name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Teacher Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: TextFormField(
                controller: controller2,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty?? true){
                    return 'Position';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Position',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: TextFormField(
                controller: controller3,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty?? true){
                    return 'Department';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Department',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
              onPressed: (){
                if (formKey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentInformationPage(
                      topic:topic,teacherName:controller1.text,position:controller2.text,deptTeacher:controller3.text)));
                }
              }, child: const Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentInformationPage extends StatelessWidget {
  String? topic;
  String? teacherName;
  String? position;
  String? deptTeacher;
  StudentInformationPage({
    required this.topic,
    required this.teacherName,
    required this.position,
    this.deptTeacher,
    Key? key}) : super(key: key);


  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ConfirmationAlertBox(context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure for submit'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('No')),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrintPage(
                            topic: topic,
                            teacherName:teacherName,
                            position:position,
                            deptTeacher:deptTeacher,
                            name: controller1.text,
                            id: controller2.text,
                            courseCode: controller3.text,
                            courseTitle: controller4.text,
                            batch: controller5.text,
                            department: controller6.text,
                            versity: controller7.text)));
              },
              child: const Text('Yes')),
        ],
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
        toolbarHeight: 85,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body:
      SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'ID / Roll';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Course Code';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Course Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller4,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Course Title';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Course Title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Batch / Section';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Batch-(section)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller6,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Department';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Department',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: TextFormField(
                  controller: controller7,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Varsity / College';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onTap: () {},
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'University Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                // print(controller1.text);
                // print(controller2.text);
                // print(controller3.text);
                // print(controller4.text);
                // print(controller5.text);
                // print(controller6.text);
                // print(controller7.text);

                if (formKey.currentState!.validate()) {
                  ConfirmationAlertBox(context);
                }
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 8,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,

                      )
                  ),
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration:BoxDecoration(color:Colors.brown),
                  accountName: Text('Developed by Hasan'),
                  accountEmail: Text('Hasan Ahmad'),
                )),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: const Text('(+880) 1716-874981'),
              hoverColor: Colors.grey,
              onTap: () {

              },

            ),
            ListTile(
              leading: const Icon(Icons.question_mark_outlined),
              title: const Text('About'),
              hoverColor: Colors.grey,
              onTap: () {

              },

            )
          ],
        ),
      ),
    );
  }
}

class PrintPage extends StatelessWidget {
  String? topic;
  String? teacherName;
  String? position;
  String? deptTeacher;
  String? name;
  String? id;
  String? courseCode;
  String? courseTitle;
  String? batch;
  String? department;
  String? versity;
  PrintPage({
    required this.topic,
    required this.teacherName,
    required this.position,
    this.deptTeacher,
    required this.name,
    required this.id,
    required this.courseCode,
    required this.courseTitle,
    required this.batch,
    required this.department,
    required this.versity,
    Key? key}) : super(key: key);

  var imageItems=[
    {'img':'http://en.wikipedia.org/wiki/Special:FilePath/Leading_University_Logo.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Cover Page'),
        backgroundColor: Colors.black,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Container(
              //color: Colors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              //height: 300,
              width: double.infinity,
              child: SingleChildScrollView(
                child:
                SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 135,
                          width: 135,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                          ),
                          child: Image.network(imageItems[0]['img']!)),
                      Container(
                        //height: 0,
                          margin: const EdgeInsets.symmetric(vertical: 19),
                          child:
                          Column(
                            children: [
                              Center(child:
                              SizedBox(height:50,child: Text('Assignment on $topic',style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold),))),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height:30,child: Text('Course Code  :  $courseCode',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Course Title :  $courseTitle',style: const TextStyle(fontSize: 13)),
                                ],
                              ),
                            ],
                          )),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.grey.shade400
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          child: const Text('   Submitted to   ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('$teacherName',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('$position',style: const TextStyle(fontSize: 14),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('$deptTeacher',style: const TextStyle(fontSize: 14),)
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.grey.shade400
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          child: const Text('   Submitted by   ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Name              :  $name',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('ID                     :  $id',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Section           :  $batch',style: const TextStyle(fontSize: 15))
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Department   :  $department',style: const TextStyle(fontSize: 15))
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
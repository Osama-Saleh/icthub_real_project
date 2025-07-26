import 'package:flutter/material.dart';
import 'package:icthubproject/core/models/course_model.dart';
import 'package:icthubproject/core/widgets/custom_text_form_filed.dart';
import 'package:icthubproject/feature/home_screen/data_source/home_screen_data_source_imple.dart';
import 'package:icthubproject/feature/sing_up/ui/sing_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future <List<CourseModel>> getData() async {
  return  await HomeScreenDataSourceImple.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFiled(
                controller: nameController,
                hintText: 'Course Name',
                labelText: 'Course Name',
                color: Colors.black,
              ),
              CustomTextFormFiled(
                controller: titleController,
                hintText: 'Course Title',
                labelText: 'Course Title',
                color: Colors.black,
              ),
              CustomTextFormFiled(
                controller: phoneController,
                hintText: 'Phone Number',
                labelText: 'Phone Number',
                color: Colors.black,
              ),
              CustomTextFormFiled(
                controller: priceController,
                hintText: 'Course Price',
                labelText: 'Course Price',
                color: Colors.black,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      HomeScreenDataSourceImple.uploadCourse(
                          name: nameController.text,
                          title: titleController.text,
                          phone: int.tryParse(phoneController.text),
                          price: int.tryParse(priceController.text),
                          context: context);
                    },
                    child: Text(
                      'Upload Course',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Container(
                height: 300,
                color: Colors.amber,
                child: FutureBuilder<List<CourseModel>>(future: getData(), builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }else if(snapshot.connectionState == ConnectionState.done){

                  return snapshot.data!.length==0 ? Text('Not Have Data') : ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name ??
                            'No Name'),
                        subtitle: Text(snapshot.data![index].title ??
                            'No Title'),
                        trailing: Text(
                            '\$${snapshot.data![index].price ?? 0}'),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount:
                        snapshot.data!.length);
                  }
                  return Text('Something went wrong');
                },),
              )
              // ElevatedButton(
              //     onPressed: () async {
              //       await Supabase.instance.client.auth.signOut();
              //       Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => SingUpScreen(),
              //         ),
              //         (route) => false,
              //       );
              //     },
              //     child: Text('SignOut'))
            ],
          ),
        ),
      ),
    );
  }
}

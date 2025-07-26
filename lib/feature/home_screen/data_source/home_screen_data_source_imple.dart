import 'package:flutter/material.dart';
import 'package:icthubproject/core/models/course_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreenDataSourceImple {
  static final supabase = Supabase.instance.client;
  // static List<CourseModel> courseModelList = [];
  static Future uploadCourse(
      {String? name,
      String? title,
      int? phone,
      int? price,
      required BuildContext context}) async {
    try {
      CourseModel courseModel = CourseModel(
        name: name,
        title: title,
        phone: phone,
        price: price,
      );
      final resp = await supabase.from('course').insert(
         courseModel.toMap()
          );
          // {'name': name, 'title': title, 'phone': phone, 'price': price}
      if (resp != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Course uploaded successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Course uploaded failed')),
        );
        print('failed');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${e.toString()}')),
      );
      print('something went wrong');
      print(e);
    }
  }

  static Future<List<CourseModel>> getData() async {
    try {
      List<CourseModel> courseModelList = [];
      final data = await supabase.from('courses').select();
      for (var item in data) {
        courseModelList.add(CourseModel.fromMap(item));
      }
      print('courseModelList ${courseModelList}');
      print('data: $data');
      return courseModelList;
    } catch (e) {

      print(e);
      return [];
    }
  }
}

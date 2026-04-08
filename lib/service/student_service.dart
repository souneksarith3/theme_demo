import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme_demo/models/student_model.dart';

class StudentService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List> getStudent() async {
    return await supabase.from("student").select();
  }

  Future<Supabase> addStudent(StudentModel model) async {
    return await supabase.from("student").insert({
      "name": model.name,
      "gender": model.gender,
      "email": model.email,
      "address": model.address,
    });
  }

  Future<Supabase> updateStudent(int? id, StudentModel model) async {
    return await supabase
        .from("student")
        .update({
          "name": model.name,
          "gender": model.gender,
          "email": model.email,
          "address": model.address,
        })
        .eq("id", id!);
  }

  Future<Supabase> deleteStudent(int id) async {
    return await supabase.from("student").delete().eq("id", id);
  }

  Future<List> getByID(int id) async {
    return await supabase.from("student").select().eq("id", id);
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _instance = Supabase.instance.client;

  Future<AuthResponse> signIn({String? email, String? password}) async {
    return await _instance.auth.signInWithPassword(email: email, password: password!);
  }

  Future<AuthResponse> signUp({String? email, String? password}) async{
    return await _instance.auth.signUp(password: password!, email: email);
  }

  Future<void> signOut() async{
    await _instance.auth.signOut();
  }
  
  Future<String?> currentUser() async{
    String currentUser =  await _instance.auth.currentUser!.id;
    return currentUser;
  }
  
}
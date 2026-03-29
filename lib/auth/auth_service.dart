import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _instance = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword({String? email, String? password}) async {
    return await _instance.auth.signInWithPassword(email: email, password: password!);
  }

  Future<AuthResponse> signUpWithEmailPassword({String? email, String? password}) async{
    return await _instance.auth.signUp(password: password!, email: email);
  }

  Future<void> signOut() async{
    await _instance.auth.signOut();
  }
  
}
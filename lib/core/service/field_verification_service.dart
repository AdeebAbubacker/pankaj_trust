import 'package:panakj_app/core/model/personal_info/personal_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FieldVerificationService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future<PersonalInfo> fieldVerificationService({
    required String name,
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('field_verification').upsert({
        'id': 9,
        'application_id': 12,
        'hall_ticket': 1,
        'group': 1,
        'father_life_status': 2,
        'mother_life_status': 2,
        'father_education': 2,
        'mother_education': 2,
        'plot_size': 2,
        'roof': 2,
        'plastering': 2,
        'water_source': 2,
        'rental_house': 2,
      }).execute();

      if (response == null) {
        throw Exception('Error posting personal info: ${response}');
      }
    } catch (e) {
      print('Error posting personal info: $e');
      throw e;
    }
    return PersonalInfo();
  }
}

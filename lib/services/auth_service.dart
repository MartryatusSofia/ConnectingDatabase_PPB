import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // ================= LOGIN =================
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'] == true;
    }

    return false;
  }

  // ================= REGISTER =================
  static Future<bool> register({
    required String email,
    required String namaDepan,
    required String namaBelakang,
    required String jenisKelamin,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'nama_depan': namaDepan,
        'nama_belakang': namaBelakang,
        'jenis_kelamin': jenisKelamin,
        'password': password,
      }),
    );

    return response.statusCode == 201;
  }
}

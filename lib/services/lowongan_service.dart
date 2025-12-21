import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/lowongan_model.dart';

class LowonganService {
  static const String baseUrl = 'http://10.0.2.2/api/lowongan';
  // ganti ke localhost / IP laptop jika perlu

  static Future<List<Lowongan>> fetchLowongan() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List data = body['data'];

      return data.map((e) => Lowongan.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data lowongan');
    }
  }
}

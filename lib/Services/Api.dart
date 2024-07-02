import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_andalas/Models/LoginModel.dart';
import 'package:my_andalas/Models/ProfileModel.dart';
import 'package:my_andalas/Models/TA_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Api {
  final String baseUrl = "https://backend-pmp.unand.dev/api/";

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login_token', token);
  }

  Future <String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('login_token');
    return token;
  }

  Future<Login> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var login = Login.fromJson(data['data']['authorization']);

      _saveToken(login.token);
      return login;
    }
    if (response.statusCode == 400) {
      return Login(token: "", type: "", expiresAt: 0);
    } else {
      throw Exception('Gagal untuk login');
    }
  }

  Future<Data?> getProfile() async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}me'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return profileFromJson(response.body).data;
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<List<Thesis>> getTheses() async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}my-theses'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return responseThesesFromJson(response.body).theses;
    } else {
      throw Exception('Failed to load profile');
    }
  }
}

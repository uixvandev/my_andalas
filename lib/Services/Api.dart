import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_andalas/Models/AddLogbookModel.dart';
import 'package:my_andalas/Models/DetailTA_Model.dart';
import 'package:my_andalas/Models/LogbooksModel.dart';
import 'package:my_andalas/Models/LoginModel.dart';
import 'package:my_andalas/Models/ProfileModel.dart';
import 'package:my_andalas/Models/Quote.dart';
import 'package:my_andalas/Models/SeminarModel.dart';
import 'package:my_andalas/Models/TA_Model.dart';
import 'package:my_andalas/Models/TopicsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final String baseUrl = "https://backend-pmp.unand.dev/api/";

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login_token', token);
  }

  Future<String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_token');
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
      await _saveToken(login.token);
      return login;
    } else if (response.statusCode == 400) {
      return Login(token: "", type: "", expiresAt: 0);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_token');
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
      throw Exception('Failed to load theses');
    }
  }

  Future<DetailTa> getDetailThesis(String id) async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}my-theses/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return detailTaFromJson(response.body);
    } else {
      throw Exception('Failed to load thesis');
    }
  }

  Future<List<Datum>?> getTopics() async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}thesis-topics'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return topicsModelFromJson(response.body).data;
    } else {
      throw Exception('Failed to load topics');
    }
  }

  Future<List<Log>?> getLogbooks(String id) async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}my-thesis/$id/logs'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return logbooksModelFromJson(response.body).logs;
    } else {
      throw Exception('Failed to load logbooks');
    }
  }

  Future<AddLogbookModel> addLogbook(String supervisorId, AddLogbookModel logbook) async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.post(
      Uri.parse('${baseUrl}my-thesis/${logbook.thesisId}/$supervisorId/logs'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'super_id': supervisorId,
        'date': logbook.date?.toIso8601String(),
        'problem': logbook.problem,
        'progress': logbook.progress,
      }),
    );

    if (response.statusCode == 200) {
      return AddLogbookModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add logbook: ${response.statusCode}');
    }
  }

  Future<Quote> fetchQuote() async {
    final response = await http.get(Uri.parse('https://favqs.com/api/qotd'));

    if (response.statusCode == 200) {
      return quoteFromJson(response.body);
    } else {
      throw Exception('Failed to load quote');
    }
  }

  Future<List<seminarData>> getSeminars() async {
    final token = await readToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}theses-upcoming-seminars'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return seminarModelFromJson(response.body).data;
    } else {
      throw Exception('Failed to load seminars');
    }
  }
}

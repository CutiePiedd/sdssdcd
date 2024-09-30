import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      'http://localhost/busbuddy'; // Update this if using a different URL

  Future<Map<String, dynamic>> registerUser(
      String fullName, String email, String password) async {
    final url = Uri.parse('$_baseUrl/register.php');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'full_name': fullName,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the full response
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<bool> loginUser(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login.php');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['success'] == true;
    } else {
      throw Exception('Failed to login user');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../models/user.dart';

class ApiService {
  Future<List<Character>> fetchCharacters() async {
    final url = Uri.parse(
      '${Constants.baseUrl}${Constants.charactersEndpoint}',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener personajes');
    }
  }
}

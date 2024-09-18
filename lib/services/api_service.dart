import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:yugiapp/utils/constants.dart';

class ApiService {
  Future<List<dynamic>> getCardsByArchetype(String archetype) async {
    final response =
        await http.get(Uri.parse('${Constants.cardsUrl}$archetype'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load cards');
    }
  }
}

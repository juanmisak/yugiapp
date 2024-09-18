import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yugiapp/utils/constants.dart';

class BanlistService {
  Future<bool> isCardBanned(String cardName) async {
    final response = await http.get(Uri.parse(Constants.banlistUrl));
    if (response.statusCode == 200) {
      final banList = json.decode(response.body);
      return banList.any((card) => card['card_name'] == cardName);
    } else {
      throw Exception('Failed to load banlist');
    }
  }
}

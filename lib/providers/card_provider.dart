import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../services/api_service.dart';

class CardProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<CardModel> _cards = [];
  bool _isLoading = false;

  List<CardModel> get cards => _cards;
  bool get isLoading => _isLoading;

  Future<void> loadCardsByArchetype(String archetype) async {
    _isLoading = true;
    notifyListeners();

    final cards = await _apiService.getCardsByArchetype(archetype);
    _cards = cards.map((card) => CardModel.fromJson(card)).toList();

    _isLoading = false;
    notifyListeners();
  }
}

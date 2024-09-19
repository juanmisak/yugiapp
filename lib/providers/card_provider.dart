import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../services/api_service.dart';

class CardProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<YuGiOhCard> _cards = [];

  YuGiOhCard? _selectedCard;

  YuGiOhCard? get selectedCard => _selectedCard;

  bool _isLoading = false;

  List<YuGiOhCard> get cards => _cards;
  bool get isLoading => _isLoading;

  Future<void> loadCardsByArchetype(String archetype) async {
    _isLoading = true;
    notifyListeners();

    final cards = await _apiService.getCardsByArchetype(archetype);
    _cards = cards.map((card) => YuGiOhCard.fromJson(card)).toList();

    // Remove card if has banlist info.
    _cards.removeWhere((card) => card.hasBanlistInfo);

    _isLoading = false;
    notifyListeners();
  }

  // Fetch card details by name
  Future<void> fetchCardDetailByName(String name) async {
    _isLoading = true;
    notifyListeners();

    final cardDetail = await _apiService.getCardDetailByName(name);

    _selectedCard = YuGiOhCard.fromJson(cardDetail);
    _isLoading = false;
    notifyListeners();
  }
}

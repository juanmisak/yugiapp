import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../services/api_service.dart';

class CardDetailProvider with ChangeNotifier {
  YuGiOhCard? card;
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchCardDetail(String cardName) async {
    isLoading = true;
    errorMessage = null;

    try {
      final cardData = await ApiService().getCardDetailByName(cardName);
      card = YuGiOhCard.fromJson(cardData);
      if (card == null) {
        errorMessage = 'Card not found';
      }
    } catch (e) {
      errorMessage = 'Failed to load card details';
    }

    isLoading = false;
    notifyListeners();
  }
}

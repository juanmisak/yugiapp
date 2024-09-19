import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../views/card_detail_view.dart';

Widget monsterCard(YuGiOhCard card, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navegar a la pantalla de detalles
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardDetailView(cardName: card.name),
        ),
      );
    },
    child: Card(
      elevation: 4,
      margin: const EdgeInsets.all(21),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholder: 'assets/images/placeholder.jpg',
          image: card.cardImages.first.imageUrlSmall,
        ),
      ),
    ),
  );
}

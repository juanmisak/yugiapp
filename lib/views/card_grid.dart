import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardGrid extends StatelessWidget {
  final List<YuGiOhCard> cards;

  const CardGrid({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/cardDetail', arguments: card.name);
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              children: [
                Expanded(
                  child: FadeInImage.assetNetwork(
                    placeholder:
                        'assets/images/placeholder.png', // Imagen local como placeholder
                    image: card.cardImages.first.imageUrl,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/placeholder.png'); // En caso de error, muestra el placeholder
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    card.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

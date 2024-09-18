import 'package:flutter/material.dart';
import '../models/card_model.dart';

Widget monsterCard(CardModel card) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ajustamos la imagen para que no sobrepase el espacio disponible
        AspectRatio(
          aspectRatio: 3 / 4, // Proporción común para cartas de Yu-Gi-Oh!
          child: Image.network(
            card.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error));
            },
          ),
        ),
        // Usamos Expanded para hacer que el contenido restante ocupe el espacio disponible
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Para evitar desbordamiento de texto
                ),
                const SizedBox(height: 4),
                Text(
                  'ATK: ${card.atk} / DEF: ${card.def}',
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugiapp/widgets/archetype_dropdown.dart';
import 'package:yugiapp/widgets/monster_card.dart';
import '../providers/card_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Yu-Gi-Oh! Cards')),
      body: Column(
        children: [
          ArchetypeDropdown(
            archetypes: const ['Crystron', 'Destiny HERO', 'Six Samurai'],
            onChanged: (archetype) {
              cardProvider.loadCardsByArchetype(archetype);
            },
          ),
          cardProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Ajusta el número de columnas
                      crossAxisSpacing: 8, // Espacio entre columnas
                      mainAxisSpacing: 8, // Espacio entre filas
                      childAspectRatio: 3 /
                          4, // Asegura que las cartas mantengan una proporción adecuada
                    ),
                    itemCount: cardProvider.cards.length,
                    itemBuilder: (context, index) {
                      return monsterCard(cardProvider.cards[index], context);
                    },
                  ),
                )
        ],
      ),
    );
  }
}

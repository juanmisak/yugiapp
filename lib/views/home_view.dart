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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Yu-Gi-Oh! Cards'),
              background: Container(
                color: Colors.white,
                child: Center(
                  child: ArchetypeDropdown(
                    archetypes: const [
                      'Crystron',
                      'Destiny HERO',
                      'Six Samurai',
                      'Worm',
                      'Witchcrafter'
                    ],
                    onChanged: (archetype) {
                      cardProvider.loadCardsByArchetype(archetype);
                    },
                  ),
                ),
              ),
            ),
          ),
          cardProvider.isLoading
              ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Ajusta el número de columnas
                      crossAxisSpacing: 8, // Espacio entre columnas
                      mainAxisSpacing: 8, // Espacio entre filas
                      childAspectRatio:
                          3 / 4, // Proporción adecuada para las cartas
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Hero(
                          tag: cardProvider.cards[index].id,
                          child: monsterCard(
                            cardProvider.cards[index],
                            context,
                          ),
                        );
                      },
                      childCount: cardProvider.cards.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

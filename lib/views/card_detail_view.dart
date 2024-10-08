import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_detail_provider.dart';

class CardDetailView extends StatefulWidget {
  final String cardName;

  const CardDetailView({Key? key, required this.cardName}) : super(key: key);

  @override
  CardDetailViewState createState() => CardDetailViewState();
}

class CardDetailViewState extends State<CardDetailView> {
  @override
  void initState() {
    super.initState();
    // Iniciar la búsqueda de detalles de la carta cuando la vista es construida
    Provider.of<CardDetailProvider>(context, listen: false)
        .fetchCardDetail(widget.cardName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CardDetailProvider>(
        builder: (context, cardDetailProvider, child) {
          if (cardDetailProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cardDetailProvider.errorMessage != null) {
            return Center(child: Text(cardDetailProvider.errorMessage!));
          }

          if (cardDetailProvider.card == null) {
            return const Center(child: Text('No details available'));
          }

          final card = cardDetailProvider.card!;

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(card.name),
                  background: Hero(
                    tag: card.id,
                    child: Image.network(
                      card.cardImages.first.imageUrlCropped,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${card.name}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text('Type: ${card.type}'),
                          const SizedBox(height: 10),
                          Text('Description: ${card.description}'),
                          const SizedBox(height: 10),
                          Text('Description: ${card.description}'),
                          const SizedBox(height: 10),
                          Text('Description: ${card.description}'),
                          const SizedBox(height: 10),
                          Text('Description: ${card.description}'),
                          const SizedBox(height: 10),
                          Text('Description: ${card.description}'),
                          const SizedBox(height: 10),
                          Text('ATK: ${card.atk}  |  DEF: ${card.def}'),
                          const SizedBox(height: 10),
                          Text(
                              'Level: ${card.level}  |  Attribute: ${card.attribute}'),
                          const SizedBox(height: 10),
                          Text('Race: ${card.race}'),
                          const SizedBox(height: 20),
                          const Text(
                            'Card Sets:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          ...card.cardSets.map((set) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                    '${set.setName} - ${set.setRarity} - \$${set.setPrice}'),
                              )),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

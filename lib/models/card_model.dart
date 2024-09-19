class YuGiOhCard {
  final int id;
  final int atk;
  final int def;
  final String name;
  final String type;
  final String attribute;
  final int level;
  final String humanReadableCardType;
  final String frameType;
  final String description;
  final String race;
  final String archetype;
  final List<CardSet> cardSets;
  final List<CardImage> cardImages;
  final List<CardPrice> cardPrices;
  final bool hasBanlistInfo;

  YuGiOhCard({
    required this.id,
    required this.atk,
    required this.def,
    required this.attribute,
    required this.level,
    required this.name,
    required this.type,
    required this.humanReadableCardType,
    required this.frameType,
    required this.description,
    required this.race,
    required this.archetype,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
    required this.hasBanlistInfo,
  });

  factory YuGiOhCard.fromJson(Map<String, dynamic> json) {
    return YuGiOhCard(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      attribute: json['attribute'] ?? '',
      level: json['level'] ?? -1,
      humanReadableCardType:
          json['humanReadableCardType'] ?? '', // Verificamos si existe
      frameType: json['frameType'],
      description: json['desc'],
      race: json['race'],
      archetype: json['archetype'] ?? '', // Verificamos si existe
      cardSets: (json['card_sets'] as List<dynamic>?)
              ?.map((set) => CardSet.fromJson(set))
              .toList() ??
          [],
      cardImages: (json['card_images'] as List<dynamic>)
          .map((image) => CardImage.fromJson(image))
          .toList(),
      cardPrices: (json['card_prices'] as List<dynamic>)
          .map((price) => CardPrice.fromJson(price))
          .toList(),
      atk: json['atk'] ?? -1,
      def: json['def'] ?? -1,
      hasBanlistInfo: json.containsKey('banlist_info'),
    );
  }
}

class CardSet {
  final String setName;
  final String setCode;
  final String setRarity;
  final String setRarityCode;
  final String setPrice;

  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      setName: json['set_name'],
      setCode: json['set_code'],
      setRarity: json['set_rarity'],
      setRarityCode: json['set_rarity_code'],
      setPrice: json['set_price'],
    );
  }
}

class CardImage {
  final int id;
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;

  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'],
      imageUrl: json['image_url'],
      imageUrlSmall: json['image_url_small'],
      imageUrlCropped: json['image_url_cropped'],
    );
  }
}

class CardPrice {
  final String cardmarketPrice;
  final String tcgplayerPrice;
  final String ebayPrice;
  final String amazonPrice;
  final String coolstuffincPrice;

  CardPrice({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPrice.fromJson(Map<String, dynamic> json) {
    return CardPrice(
      cardmarketPrice: json['cardmarket_price'],
      tcgplayerPrice: json['tcgplayer_price'],
      ebayPrice: json['ebay_price'],
      amazonPrice: json['amazon_price'],
      coolstuffincPrice: json['coolstuffinc_price'],
    );
  }
}

class CardModel {
  final String name;
  final int atk;
  final int def;
  final String imageUrl;
  final String desc;

  CardModel(
      {required this.name,
      required this.atk,
      required this.def,
      required this.imageUrl,
      required this.desc});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'],
      atk: json['atk'] ?? -1,
      def: json['def'] ?? -1,
      imageUrl: json['card_images'][0]['image_url'],
      desc: json['desc'],
    );
  }
}

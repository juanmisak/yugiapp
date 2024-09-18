class Constants {
  // Base URL de la API de Yu-Gi-Oh
  static const String baseUrl = 'https://db.ygoprodeck.com/api/v7';
  // Endpoints específicos
  static const String archetypesUrl = '$baseUrl/archetypes.php';
  static const String cardsUrl = '$baseUrl/cardinfo.php?archetype=';
  static const String banlistUrl = '$baseUrl/banlist.php';

  // Parámetros o valores comunes
  static const String bannedParam =
      'banlist'; // Parámetro para filtrar cartas en la banlist
}

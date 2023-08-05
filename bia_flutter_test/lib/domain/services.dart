part of 'domain.dart';

class Service {
  factory Service() => instance;

  Service._internal();

  static final Service instance = Service._internal();

  static const String endpointsRoute = 'assets/endpoints/endpoints.json';
  static const String apiKeysRoute = 'assets/api_key/keys.json';

  late Map<String, dynamic> endpointsJson;
  late Map<String, dynamic> apiKeysJson;
  late String baseUrl;
  late String marvelApiKey;
  late String hash;

  Future<void> loadEndpoins() async {
    final String endpointsStr = await rootBundle.loadString(endpointsRoute);
    endpointsJson = jsonDecode(endpointsStr);
    baseUrl = endpointsJson['baseUrl']!;
  }

  Future<void> loadApiKeys() async {
    final String apiKeysStr = await rootBundle.loadString(apiKeysRoute);
    apiKeysJson = jsonDecode(apiKeysStr);
    marvelApiKey = apiKeysJson['marvel_key']!;
    hash = apiKeysJson['hash']!;
  }

  Future<CharactersResponse> getCharacters() async {
    await loadEndpoins();
    await loadApiKeys();
    final String getCharactersUrl = endpointsJson['getCharactersUrl']!;

    final uri = Uri.https(
      baseUrl,
      getCharactersUrl,
      <String, String>{
        'apikey': marvelApiKey,
        'hash': hash,
        'ts': '1',
      },
    );

    final http.Response response = await http.get(uri);
    return CharactersResponse.fromJson(jsonDecode(response.body));
  }
}

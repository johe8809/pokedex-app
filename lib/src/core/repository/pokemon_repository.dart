part of com.pokedex_app.repository;

class PokemonRepository {
  PokemonRepository._();

  static final PokemonRepository instance = PokemonRepository._();
  // TODO(yonnathan): set from env
  final String basePath = 'https://pokeapi.co/api/v2';
  final Map<String, String> headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<Response?> request({
    required HttpMethod method,
    String? path,
    Object? payload,
    Uri? uri,
  }) async {
    Uri url = uri ?? Uri.parse(<String>[basePath, path!].join('/'));
    Response? response;
    try {
      switch (method) {
        case HttpMethod.get:
          response = await get(
            url,
            headers: headers,
          );
          break;
        case HttpMethod.post:
          response = await post(
            url,
            headers: headers,
            body: payload,
          );
          break;
        case HttpMethod.put:
          response = await put(
            url,
            headers: headers,
            body: payload,
          );
          break;
        case HttpMethod.delete:
          response = await delete(
            url,
            headers: headers,
            body: payload,
          );
          break;
        default:
          throw UnimplementedError(
            'Method ${method.toString()} is not implemented',
          );
      }
      return response;
    } on Exception catch (_) {
      rethrow;
    }
  }
}

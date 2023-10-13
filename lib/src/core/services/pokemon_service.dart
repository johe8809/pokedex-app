part of com.pokedex_app.services;

class PokemonService {
  PokemonService._();

  static final PokemonService instance = PokemonService._();

  Future<List<PokemonType>?> retreivePokemonTypes() async {
    try {
      Response? response = await Repository.instance.request(
        path: 'type',
        method: HttpMethod.get,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response!.body) as Map<String, dynamic>;
      List<PokemonType> results = (rawData['results'] as List<dynamic>)
          .map(
            (dynamic e) => PokemonType.fromJson(e as Map<String, dynamic>),
          )
          .where(
            (PokemonType element) =>
                !<String>['unknown', 'shadow'].contains(element.name),
          )
          .toList();
      return results;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<List<Pokemon>?> retreivePokemonListByType(String url) async {
    try {
      Response? response = await Repository.instance.request(
        uri: Uri.parse(url),
        method: HttpMethod.get,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response!.body) as Map<String, dynamic>;

      List<dynamic> results = (rawData['pokemon'] as List<dynamic>).toList();
      List<Pokemon> pokemonList = await Future.wait(
        results.map(
          (dynamic e) => retreivePokemon(
            e['pokemon']['url'].toString(),
          ).then((Pokemon? value) => value!),
        ),
      );

      return pokemonList
          .where((Pokemon element) => element.image != null)
          .toList();
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Pokemon?> retreivePokemon(String url) async {
    try {
      Response? response = await Repository.instance.request(
        uri: Uri.parse(url),
        method: HttpMethod.get,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response!.body) as Map<String, dynamic>;

      return Pokemon.fromJson(rawData);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

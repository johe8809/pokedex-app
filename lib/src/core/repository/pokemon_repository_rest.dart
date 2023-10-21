part of com.pokedex_app.repository;

class PokemonRepositoryRest implements PokemonRepository {
  final String basePath = 'https://pokeapi.co/api/v2';
  final Map<String, String> headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @override
  Future<List<PokemonType>?> retreivePokemonTypes() async {
    Uri url = Uri.parse('$basePath/type');
    try {
      Response response = await get(
        url,
        headers: headers,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<PokemonType> results = (rawData['results'] as List<dynamic>)
          .map(
            (dynamic e) => PokemonType.fromJson(e as Map<String, dynamic>),
          )
          .where(
            (PokemonType element) =>
                !<String>['unknown', 'shadow'].contains(element.name!.value),
          )
          .toList();
      return results;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Pokemon>?> retreivePokemonListByType(String type) async {
    Uri url = Uri.parse('$basePath/type/$type');
    try {
      Response? response = await get(
        url,
        headers: headers,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response.body) as Map<String, dynamic>;

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

  @override
  Future<Pokemon?> retreivePokemon(String url) async {
    try {
      Response? response = await get(
        Uri.parse(url),
        headers: headers,
      );

      Map<String, dynamic> rawData =
          jsonDecode(response.body) as Map<String, dynamic>;

      return Pokemon.fromJson(rawData);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

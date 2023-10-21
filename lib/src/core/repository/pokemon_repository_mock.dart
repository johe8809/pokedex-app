part of com.pokedex_app.repository;

class PokemonRepositoryMock implements PokemonRepository {
  final String basePath = 'https://pokeapi.co/api/v2';
  final Map<String, String> headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @override
  Future<List<PokemonType>?> retreivePokemonTypes() async {
    try {
      String responseBody =
          await rootBundle.loadString('assets/mock/pokemon_api_v2_type.json');
      Map<String, dynamic> rawData =
          jsonDecode(responseBody) as Map<String, dynamic>;
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
    try {
      String responseBody = await rootBundle
          .loadString('assets/mock/pokemon_api_v2_list_by_type.json');
      Map<String, dynamic> rawData =
          jsonDecode(responseBody) as Map<String, dynamic>;

      List<dynamic> results = (rawData['pokemon'] as List<dynamic>).toList();
      List<Pokemon> pokemonList = await Future.wait(
        results.map(
          (dynamic e) async {
            String responseBody = await rootBundle
                .loadString('assets/mock/pokemon_api_v2_pokemon_info.json');
            Map<String, dynamic> rawData =
                jsonDecode(responseBody) as Map<String, dynamic>;

            return Pokemon.fromJson(rawData);
          },
        ),
      );

      return pokemonList
          .where((Pokemon element) => element.image != null)
          .toList();
    } on Exception catch (_) {
      rethrow;
    }
  }
}

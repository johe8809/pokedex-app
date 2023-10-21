part of com.pokedex_app.services;

class PokemonService {
  PokemonService._();

  static final PokemonService instance = PokemonService._();
  PokemonRepository repository = PokemonRepositoryRest();

  Future<List<PokemonType>?> retreivePokemonTypes() async {
    try {
      return repository.retreivePokemonTypes();
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<List<Pokemon>?> retreivePokemonListByType(String type) async {
    try {
      return repository.retreivePokemonListByType(type);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Pokemon?> retreivePokemon(String url) async {
    try {
      return repository.retreivePokemon(url);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

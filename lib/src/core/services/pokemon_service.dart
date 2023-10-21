part of com.pokedex_app.services;

class PokemonService {
  PokemonService(PokemonRepository _repository) : repository = _repository;

  final PokemonRepository repository;

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
}

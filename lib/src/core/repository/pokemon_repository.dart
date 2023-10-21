part of com.pokedex_app.repository;

abstract class PokemonRepository {
  Future<List<PokemonType>?> retreivePokemonTypes();
  Future<List<Pokemon>?> retreivePokemonListByType(String type);
}

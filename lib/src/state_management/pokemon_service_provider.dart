part of com.pokedex_app.state_management;

final Provider<PokemonRepository> pokemonRespositoryProvider =
    Provider<PokemonRepository>(
  (ProviderRef<PokemonRepository> ref) => PokemonRepositoryRest.instance,
);

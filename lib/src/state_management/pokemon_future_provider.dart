part of com.pokedex_app.state_management;

FutureProviderFamily<List<Pokemon>?, String> pokemonListProvider =
    FutureProvider.family(
  (_, String type) async {
    PokemonRepository repository = PokemonRepositoryRest();
    PokemonService service = PokemonService(repository);
    return service.retreivePokemonListByType(
      type,
    );
  },
);

final AutoDisposeFutureProvider<List<PokemonType>?> pokemonTypesProvider =
    FutureProvider.autoDispose(
  (_) async {
    PokemonRepository repository = PokemonRepositoryRest();
    PokemonService service = PokemonService(repository);
    return service.retreivePokemonTypes();
  },
);

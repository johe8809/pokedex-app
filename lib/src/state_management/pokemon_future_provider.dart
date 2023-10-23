part of com.pokedex_app.state_management;

FutureProviderFamily<List<Pokemon>?, String> pokemonListProvider =
    FutureProvider.family(
  (FutureProviderRef<List<Pokemon>?> ref, String type) async {
    PokemonRepository repository = ref.read(pokemonRespositoryProvider);
    return repository.retreivePokemonListByType(type);
  },
);

final AutoDisposeFutureProvider<List<PokemonType>?> pokemonTypesProvider =
    FutureProvider.autoDispose(
  (AutoDisposeFutureProviderRef<List<PokemonType>?> ref) async {
    PokemonRepository repository = ref.read(pokemonRespositoryProvider);
    return repository.retreivePokemonTypes();
  },
);

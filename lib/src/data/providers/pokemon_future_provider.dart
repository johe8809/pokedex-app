part of com.pokedex_app.data.providers;

FutureProviderFamily<List<Pokemon>?, String> pokemonListProvider =
    FutureProvider.family(
  (_, String type) async => PokemonService.instance.retreivePokemonListByType(
    type,
  ),
);

final AutoDisposeFutureProvider<List<PokemonType>?> pokemonTypesProvider =
    FutureProvider.autoDispose(
  (_) async => PokemonService.instance.retreivePokemonTypes(),
);

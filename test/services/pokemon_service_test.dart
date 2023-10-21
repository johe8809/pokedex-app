import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/src/core/core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Load Pokemon Types', () async {
    PokemonRepository repository = PokemonRepositoryMock();
    PokemonService service = PokemonService(repository);

    List<PokemonType>? pokemonTypes = await service.retreivePokemonTypes();

    expect(pokemonTypes!.length, 18);
    expect(pokemonTypes.first.name, PokemonTypeEnum.normal);
  });

  test('Load List of Pokemons by Type', () async {
    PokemonRepository repository = PokemonRepositoryMock();
    PokemonService service = PokemonService(repository);

    List<Pokemon>? pokemonList = await service.retreivePokemonListByType(
      PokemonTypeEnum.ice.value,
    );

    expect(pokemonList!.length, 2);

    Pokemon pokemon = pokemonList.first;

    expect(pokemon.id, 87);
    expect(pokemon.name, 'dewgong');
    expect(pokemon.height, 17);
    expect(pokemon.weight, 1200);
    expect(pokemon.types!.length, 2);
    expect(pokemon.stats!.length, 6);
  });
}

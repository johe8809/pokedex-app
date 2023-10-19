part of com.pokedex_app.ui.widgets;

class PokemonList extends StatelessWidget {
  const PokemonList({
    required this.pokemonList,
    super.key,
  });
  final List<Pokemon>? pokemonList;

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1 / 0.5,
        children: pokemonList!
            .map(
              (Pokemon pokemon) => PokemonCard(pokemon: pokemon),
            )
            .toList(),
      );
}

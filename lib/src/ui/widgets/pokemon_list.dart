part of com.pokedex_app.ui.widgets;

class PokemonList extends StatelessWidget {
  const PokemonList({
    required this.pokemonList,
    super.key,
  });
  final List<Pokemon>? pokemonList;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, BoxConstraints constraints) => Wrap(
          spacing: 32,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children: List<Widget>.generate(
            pokemonList!.length,
            (int index) {
              Pokemon pokemon = pokemonList![index];
              return PokemonCard(
                index: index,
                pokemon: pokemon,
                width: (constraints.maxWidth * 0.33) - 32,
              );
            },
          ),
        ),
      );
}

part of com.pokedex_app.ui.widgets;

class PokemonAbout extends StatelessWidget {
  const PokemonAbout(
    this.pokemon, {
    super.key,
  });
  final Pokemon pokemon;

  Widget dataItem({
    required String title,
    required Widget value,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: BodyTextStyle.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          value,
        ],
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pokédex Data',
              style: BodyTextStyle.body1.copyWith(
                color: pokemonTypeColors[pokemon.types!.first],
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacing.spacingV16,
            LayoutBuilder(
              builder: (_, BoxConstraints constraints) => SizedBox(
                width: constraints.maxWidth * 0.4,
                child: Column(
                  children: <Widget>[
                    dataItem(
                      title: 'Height',
                      value: Text(
                        pokemon.height!.toString(),
                        style: BodyTextStyle.body1,
                      ),
                    ),
                    Spacing.spacingV16,
                    dataItem(
                      title: 'Weight',
                      value: Text(
                        pokemon.weight!.toString(),
                        style: BodyTextStyle.body1,
                      ),
                    ),
                    Spacing.spacingV16,
                    dataItem(
                      title: 'Types',
                      value: Wrap(
                        spacing: 8,
                        children:
                            pokemon.types!.map(PokemonTypeBadge.new).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

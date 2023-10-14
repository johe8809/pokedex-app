part of com.pokedex_app.ui.widgets;

class PokemonStats extends StatelessWidget {
  const PokemonStats(
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
              'Base Stats',
              style: BodyTextStyle.body1.copyWith(
                color: pokemonTypeColors[pokemon.types!.first],
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacing.spacingV16,
            if (pokemon.stats != null)
              LayoutBuilder(
                builder: (_, BoxConstraints constraints) => SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      PokemonStat stat = pokemon.stats![index];
                      return dataItem(
                        title: stat.name!.split('-').join(' ').toUpperCase(),
                        value: Text(
                          stat.value!.toString(),
                          style: BodyTextStyle.body1,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Spacing.spacingV16,
                    itemCount: pokemon.stats!.length,
                  ),
                ),
              ),
          ],
        ),
      );
}

part of com.pokedex_app.ui.widgets;

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: PokemonDetail(pokemon),
              ),
            ),
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: pokemonTypeColors[pokemon.types!.first],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '#${pokemon.id!.toString()}',
                        style: BodyTextStyle.body1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Spacing.spacingV4,
                      Text(
                        pokemon.name!.split('-').join(' ').toUpperCase(),
                        style: DisplayTextStyle.display2.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacing.spacingV4,
                      Wrap(
                        spacing: 8,
                        children: pokemon.types!
                            .map(
                              PokemonTypeBadge.new,
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Image.network(
                  pokemon.image!,
                  width: 144,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      );
}

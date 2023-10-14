part of com.pokedex_app.ui.widgets;

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.index,
    required this.pokemon,
    this.width,
    super.key,
  });

  final int index;
  final double? width;
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
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: pokemonTypeColors[pokemon.types!.first],
            borderRadius: BorderRadius.circular(8),
          ),
          height: 200,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
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
                    Flexible(
                      child: Text(
                        pokemon.name!.split('-').join(' ').toUpperCase(),
                        style: DisplayTextStyle.display2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacing.spacingV4,
                    Wrap(
                      spacing: 8,
                      children:
                          pokemon.types!.map(PokemonTypeBadge.new).toList(),
                    ),
                  ],
                ),
              ),
              Image.network(
                pokemon.image!,
                width: 144,
                height: 175,
              ),
            ],
          ),
        ),
      );
}

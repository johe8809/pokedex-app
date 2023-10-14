part of com.pokedex_app.ui.widgets;

class PokemonDetailAppBarTitle extends StatelessWidget {
  const PokemonDetailAppBarTitle(
    this.pokemon, {
    super.key,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            pokemon.image!,
            width: 250,
            height: 250,
          ),
          Column(
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
                style: DisplayTextStyle.display3.copyWith(
                  color: Colors.white,
                ),
              ),
              Spacing.spacingV4,
              Wrap(
                spacing: 8,
                children: pokemon.types!
                    .map(
                      (String e) => DecoratedBox(
                        decoration: BoxDecoration(
                          color: pokemonTypeColors[e],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            e.toUpperCase(),
                            style: BodyTextStyle.body2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      );
}

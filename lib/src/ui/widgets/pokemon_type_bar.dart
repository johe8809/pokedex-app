part of com.pokedex_app.ui.widgets;

class PokemonTypeBar extends StatelessWidget {
  const PokemonTypeBar({
    required this.pokemonTypes,
    required this.onChangeType,
    super.key,
  });

  final List<PokemonType>? pokemonTypes;
  final ValueChanged<PokemonTypeEnum> onChangeType;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              key: const Key('pokemon_type_bar_key'),
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: pokemonTypes!
                  .map(
                    (PokemonType type) => InkWell(
                      onTap: () {
                        onChangeType(type.name!);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: pokemonTypeColors[type.name!.value],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            type.name!.value.toUpperCase(),
                            style: BodyTextStyle.body2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

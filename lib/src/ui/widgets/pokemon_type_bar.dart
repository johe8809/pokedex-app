part of com.pokedex_app.ui.widgets;

class PokemonTypeBar extends StatelessWidget {
  const PokemonTypeBar({
    required this.pokemonTypes,
    required this.onChangeType,
    super.key,
  });

  final List<PokemonType>? pokemonTypes;
  final ValueChanged<int> onChangeType;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                pokemonTypes!.length,
                (int index) {
                  PokemonType type = pokemonTypes![index];
                  return InkWell(
                    onTap: () {
                      onChangeType(index);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: pokemonTypeColors[type.name],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        child: Text(
                          type.name!.toUpperCase(),
                          style: BodyTextStyle.body2.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}

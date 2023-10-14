part of com.pokedex_app.ui.widgets;

class PokemonTypeBadge extends StatelessWidget {
  const PokemonTypeBadge(
    this.type, {
    super.key,
  });
  final String type;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: pokemonTypeColors[type],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            type.toUpperCase(),
            style: BodyTextStyle.body2.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      );
}

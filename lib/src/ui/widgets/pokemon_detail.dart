part of com.pokedex_app.ui.widgets;

class PokemonDetail extends StatefulWidget {
  const PokemonDetail(
    this.pokemon, {
    super.key,
  });
  final Pokemon pokemon;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: pokemonTypeColors[widget.pokemon.types!.first],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  widget.pokemon.image!,
                  width: 144,
                  height: 175,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '#${widget.pokemon.id!.toString()}',
                      style: BodyTextStyle.body1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Spacing.spacingV4,
                    Text(
                      widget.pokemon.name!.split('-').join(' ').toUpperCase(),
                      style: DisplayTextStyle.display2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Spacing.spacingV4,
                    Wrap(
                      spacing: 8,
                      children: widget.pokemon.types!
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
            ),
          ),
          DefaultTabController(
            length: 3,
            child: TabBar(
              // controller: TabController(length: 3, vsync: ),
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
        ],
      );
}

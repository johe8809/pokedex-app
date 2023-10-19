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
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: pokemonTypeColors[widget.pokemon.types!.first],
              toolbarHeight: 300,
              leading: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, left: 32),
                  child: InkResponse(
                    onTap: Navigator.of(context).pop,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              title: PokemonDetailAppBarTitle(widget.pokemon),
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(text: 'About'),
                  Tab(text: 'Stats'),
                  Tab(text: 'Evolution'),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                PokemonAbout(widget.pokemon),
                PokemonStats(widget.pokemon),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}

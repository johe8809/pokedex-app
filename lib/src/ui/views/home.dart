part of com.pokedex_app.ui.views;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<PokemonType>? pokemonTypes = <PokemonType>[];

  late int currentTypeIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      pokemonTypes = await PokemonService.instance.retreivePokemonTypes() ??
          <PokemonType>[];
      setState(() {});
    });
    super.initState();
  }

  Future<void> onChangeType(int index) async {
    currentTypeIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: DisplayTextStyle.display3.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width * 0.9,
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
          ),
          child: Column(
            children: <Widget>[
              Spacing.spacingV32,
              PokemonTypeBar(
                pokemonTypes: pokemonTypes,
                onChangeType: onChangeType,
              ),
              Spacing.spacingV32,
              if (pokemonTypes!.isNotEmpty)
                FutureBuilder<List<Pokemon>?>(
                  future: PokemonService.instance.retreivePokemonListByType(
                    pokemonTypes![currentTypeIndex].url!,
                  ),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Pokemon>?> snapshot,
                  ) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      return PokemonList(pokemonList: snapshot.data);
                    }
                    return const SizedBox.shrink();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

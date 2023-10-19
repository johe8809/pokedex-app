part of com.pokedex_app.ui.views;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PokemonTypeEnum? pokemonType = PokemonTypeEnum.ice;

  Future<void> onChangeType(PokemonTypeEnum type) async {
    pokemonType = type;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: 32,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: FutureBuilder<List<PokemonType>?>(
              future: PokemonService.instance.retreivePokemonTypes(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<PokemonType>?> snapshot,
              ) {
                if (!snapshot.hasError && snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      PokemonTypeBar(
                        pokemonTypes: snapshot.data,
                        onChangeType: onChangeType,
                      ),
                      Spacing.spacingV32,
                      FutureBuilder<List<Pokemon>?>(
                        future:
                            PokemonService.instance.retreivePokemonListByType(
                          pokemonType!.value,
                        ),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<List<Pokemon>?> snapshot,
                        ) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasError && snapshot.hasData) {
                            return PokemonList(pokemonList: snapshot.data);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
}

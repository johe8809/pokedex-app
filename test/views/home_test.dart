import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/main.dart' as app;
import 'package:pokedex_app/src/core/core.dart';
import 'package:pokedex_app/src/state_management/state_management.dart';

void main() {
  group('Test HomeView => ', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'should render title, pokemon type bar and pokemon list correctly', (
      WidgetTester tester,
    ) async {
      await app.main(
        overrides: <Override>[
          pokemonRespositoryProvider.overrideWithValue(
            PokemonRepositoryMock.instance,
          ),
        ],
      );

      Finder appBarTitleFinder =
          find.byKey(const Key('home_view_app_bar_title_key'));
      Text appBarTitleWidget = tester.widget(appBarTitleFinder);
      expect(appBarTitleWidget.data, 'Pokédex');

      await tester.pumpAndSettle(const Duration(seconds: 1));
      Finder pokemonTypeBarFinder = find.byKey(
        const Key('home_view_pokemon_type_bar_key'),
      );
      expect(pokemonTypeBarFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
      Finder pokemonListFinder = find.byKey(
        const Key('home_view_pokemon_list_key'),
      );
      expect(pokemonListFinder, findsOneWidget);
    });

    testWidgets('should render the PokemonTypeBar correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await app.main(
        overrides: <Override>[
          pokemonRespositoryProvider.overrideWithValue(
            PokemonRepositoryMock.instance,
          ),
        ],
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));
      Finder appBarTitleFinder =
          find.byKey(const Key('home_view_app_bar_title_key'));
      Text appBarTitleWidget = tester.widget(appBarTitleFinder);
      expect(appBarTitleWidget.data, 'Pokédex');

      await tester.pumpAndSettle(const Duration(seconds: 7));

      Finder pokemonTypeBarFinder = find.byKey(
        const Key('home_view_pokemon_type_bar_key'),
      );
      expect(pokemonTypeBarFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
      Finder pokemonListFinder = find.byKey(
        const Key('home_view_pokemon_list_key'),
      );
      expect(pokemonListFinder, findsOneWidget);
    });
  });
}

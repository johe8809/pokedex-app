import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/main.dart' as app;
import 'package:pokedex_app/src/core/core.dart';
import 'package:pokedex_app/src/state_management/state_management.dart';

Future<void> _app() async => app.main(
      overrides: <Override>[
        pokemonRespositoryProvider.overrideWithValue(
          PokemonRepositoryMock.instance,
        ),
      ],
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Test HomeView => ', () {
    testWidgets(
        'should render title, pokemon type bar and pokemon list correctly', (
      WidgetTester widgetTester,
    ) async {
      await _app();
      Finder appBarTitleFinder =
          find.byKey(const Key('home_view_app_bar_title_key'));
      Text appBarTitleWidget = widgetTester.widget(appBarTitleFinder);
      expect(appBarTitleWidget.data, 'Pokédex');

      await widgetTester.pump(const Duration(seconds: 1));
      Finder pokemonTypeBarFinder = find.byKey(
        const Key('home_view_pokemon_type_bar_key'),
      );
      expect(pokemonTypeBarFinder, findsOneWidget);

      await widgetTester.pump(const Duration(seconds: 1));
      Finder pokemonListFinder = find.byKey(
        const Key('home_view_pokemon_list_key'),
      );
      expect(pokemonListFinder, findsOneWidget);
    });

    testWidgets('should render the PokemonTypeBar correctly',
        (WidgetTester widgetTester) async {
      await _app();
      await widgetTester.pumpAndSettle(const Duration(seconds: 10));
      Finder pokemonTypeBarFinder =
          find.byKey(const Key('pokemon_type_bar_key'));
      Wrap types = widgetTester.widget(pokemonTypeBarFinder);

      expect(types.children.length, 18);
    });
  });
}

part of com.pokedex_app.typing;

class PokemonStat {
  PokemonStat.fromJson(Map<String, dynamic> json) {
    value = json['base_stat'] != null ? json['base_stat'] as int : null;
    name = json['stat'] != null ? json['stat']['name'] as String : null;
  }

  int? value;
  String? name;

  @override
  int get hashCode => value.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is PokemonStat && other.value == value && other.name == name;
  }

  @override
  String toString() => 'PokemonStat => $name: $value';
}

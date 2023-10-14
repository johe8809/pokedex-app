part of com.pokedex_app.typing;

class PokemonStat {
  PokemonStat.fromJson(Map<String, dynamic> json) {
    value = json['base_stat'] != null ? json['base_stat'] as int : null;
    name = json['stat'] != null ? json['stat']['name'] as String : null;
  }

  int? value;
  String? name;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other.runtimeType is PokemonStat && other.toString() == toString();
  }

  @override
  String toString() => 'PokemonStat => $name: $value';
}

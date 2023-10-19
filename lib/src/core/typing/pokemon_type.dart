part of com.pokedex_app.typing;

class PokemonType {
  PokemonType.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null
        ? PokemonTypeEnum.fromString(json['name'] as String)
        : null;
    url = json['url'] != null ? json['url'] as String : null;
  }

  PokemonTypeEnum? name;
  String? url;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other.runtimeType is PokemonType && other.toString() == toString();
  }

  @override
  String toString() => 'PokemonType => $name';
}

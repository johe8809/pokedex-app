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
  int get hashCode => name.hashCode ^ url.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is PokemonType && other.name == name && other.url == url;
  }

  @override
  String toString() => 'PokemonType => $name';
}

part of com.pokedex_app.typing;

class Pokemon {
  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : null;
    name = json['name'] != null ? json['name'] as String : null;
    if (json['sprites'] != null) {
      Map<String, dynamic> other =
          json['sprites']['other'] as Map<String, dynamic>;
      for (String element in other.keys) {
        String? url = getImageUrl(other[element] as Map<String, dynamic>);
        if (url != null) {
          image = url;
          break;
        }
      }
    }
    height = json['height'] != null ? json['height'] as int : null;
    weight = json['weight'] != null ? json['weight'] as int : null;
    if (json['types'] != null) {
      types = (json['types'] as List<dynamic>)
          .map((dynamic e) => e['type']['name'] as String)
          .toList();
    }
    if (json['stats'] != null) {
      stats = (json['stats'] as List<dynamic>)
          .map(
            (dynamic e) => PokemonStat.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
  }

  int? id;
  String? name;
  String? image;
  int? height;
  int? weight;
  List<String>? types;
  List<PokemonStat>? stats;

  String? getImageUrl(Map<String, dynamic> json) {
    if (json['front_default'] != null) {
      String frontDefault = json['front_default'] as String;
      if (frontDefault.split('.').last != 'svg') {
        return frontDefault;
      }
    }
    return null;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other.runtimeType is Pokemon && other.toString() == toString();
  }

  @override
  String toString() => 'Pokemon => $id - $name';
}

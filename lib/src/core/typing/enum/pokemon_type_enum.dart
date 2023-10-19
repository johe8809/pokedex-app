part of com.pokedex_app.typing;

enum PokemonTypeEnum {
  normal('normal'),
  fighting('fighting'),
  flying('flying'),
  poison('poison'),
  ground('ground'),
  rock('rock'),
  bug('bug'),
  ghost('ghost'),
  steel('steel'),
  fire('fire'),
  water('water'),
  grass('grass'),
  electric('electric'),
  psychic('psychic'),
  ice('ice'),
  dragon('dragon'),
  dark('dark'),
  fairy('fairy'),
  unknown('unknown'),
  shadow('shadow');

  const PokemonTypeEnum(this.value);
  factory PokemonTypeEnum.fromString(String _value) => switch (_value) {
        'normal' => normal,
        'fighting' => fighting,
        'flying' => flying,
        'poison' => poison,
        'ground' => ground,
        'rock' => rock,
        'bug' => bug,
        'ghost' => ghost,
        'steel' => steel,
        'fire' => fire,
        'water' => water,
        'grass' => grass,
        'electric' => electric,
        'psychic' => psychic,
        'ice' => ice,
        'dragon' => dragon,
        'dark' => dark,
        'fairy' => fairy,
        'unknown' => unknown,
        'shadow' => shadow,
        _ => ice,
      };

  final String value;
}

class Brew {
  final String name;
  final String sugars;
  final int strength;

  Brew({this.name, this.sugars, this.strength});

  Map<String, dynamic> toMap() {
    return {
      'sugars': this.sugars,
      'name': this.name,
      'strength': this.strength,
    };
  }

  Brew fromMap(Map<String, dynamic> map) {
    return Brew(
        name: map['name'] ?? '',
        strength: map['strength'] ?? 0,
        sugars: map['sugars'] ?? '0');
  }
}

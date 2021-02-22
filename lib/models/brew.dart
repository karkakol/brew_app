class Brew {
  final String name;
  final String sugars;
  final int strenght;

  Brew({this.name, this.sugars, this.strenght});
  toMap(){
    return {
      'sugars': this.sugars,
      'name': this.name,
      'strenght': this.strenght,
    };
  }
  Brew fromMap(Map<String, dynamic> map){
    return Brew(
        name: map['name'] ?? '',
        strenght: map['strenght'] ?? 0,
        sugars: map['sugars'] ?? '0');
  }
}

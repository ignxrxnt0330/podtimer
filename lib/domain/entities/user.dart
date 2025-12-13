class User {
  String name;

  User({
    this.name = ""

  });

  User copyWith({
    final String? name,
  })  => User(
    name: name ?? this.name,

  );

  @override
  String toString() {
    return 'User { name: $name}';
  }
}

enum Language {
  english(name: 'English', code: 'en'),
  turkish(name: 'Turkish', code: 'tr');

  const Language({required this.name, required this.code});

  final String name;
  final String code;
}

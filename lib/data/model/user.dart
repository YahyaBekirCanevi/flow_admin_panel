class AppUser {
  final int id;
  final String name;
  final String email;
  final String status;
  final String? pictureUrl;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    this.pictureUrl,
  });
}

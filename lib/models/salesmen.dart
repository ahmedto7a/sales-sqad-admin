class Salesman {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String target;
  final String current;
  final String role;
  final String status;
  final dynamic team;

  Salesman({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.target,
    required this.current,
    required this.role,
    required this.status,
    required this.team,
  });

  factory Salesman.fromJson(Map<String, dynamic> json) {
    return Salesman(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      target: json['target'],
      current: json['current'],
      role: json['role'],
      status: json['status'],
      team: json['team'],
    );
  }
}

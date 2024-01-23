class AdminInfo {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String target;
  final String current;
  final String role;
  final String status;
  final dynamic team;

  AdminInfo({
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

  factory AdminInfo.fromJson(Map<String, dynamic> json) {
    return AdminInfo(
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
  Map<String, dynamic> toJson() { 
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'target': target,
      'current': current,
      'role': role,
      'status': status,
      'team': team,
    };
  }
}

class LeadInfo {
  final int id;
  final String name;
  final String? email;
  final String phone;
  final String value;
  final String? responseTime;
  final String? companyName;
  final String? jobTitle;
  final String? comment;
  final String status;
  final String sales;
  final String createdAt;

  LeadInfo({
    required this.id,
    required this.name,
    this.email,
    required this.phone,
    required this.value,
    this.responseTime,
    this.companyName,
    this.jobTitle,
    this.comment,
    required this.status,
    required this.sales,
    required this.createdAt,
  });

  factory LeadInfo.fromJson(Map<String, dynamic> json) {
    return LeadInfo(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      value: json['value'],
      responseTime: json['response_time'],
      companyName: json['company_name'],
      jobTitle: json['job_title'],
      comment: json['comment'],
      status: json['status'],
      sales: json['sales'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'value': value,
      'response_time': responseTime,
      'company_name': companyName,
      'job_title': jobTitle,
      'comment': comment,
      'status': status,
      'sales': sales,
      'created_at': createdAt,
    };
  }
}

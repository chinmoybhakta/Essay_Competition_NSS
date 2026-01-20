class DataModel {
  final String? name;
  final String? id;
  final String? email;
  final String? batch;
  final String? department;
  final String? mobile;
  final String? essay;

  DataModel({
    this.name,
    this.id,
    this.batch,
    this.department,
    this.email,
    this.essay,
    this.mobile,
  });

  DataModel copyWith({
    String? name,
    String? id,
    String? email,
    String? batch,
    String? department,
    String? mobile,
    String? essay,
  }) {
    return DataModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      batch: batch ?? this.batch,
      department: department ?? this.department,
      mobile: mobile ?? this.mobile,
      essay: essay ?? this.essay,
    );
  }
}

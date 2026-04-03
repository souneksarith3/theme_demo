class StudentModel {
  int? id;
  String? name, gender, email, address;

  StudentModel({
    required int id,
    required String name,
    required String gender,
    required String email,
    required String address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'email': email,
      'address': address,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      gender: map['gender'],
      email: map['email'],
      address: map['address'],
    );
  }
}

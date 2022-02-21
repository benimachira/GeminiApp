class ModelUser {
  int id;
  String name;
  String phone_number;
  String email;

  ModelUser(json) {
    Map<String, dynamic> data = json;

    this.id = data['id'];
    this.name = data['name'];
    this.phone_number = data['phone_number'];
    this.email = data['email'];
  }
}
